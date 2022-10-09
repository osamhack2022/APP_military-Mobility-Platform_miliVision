import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/provider/auth.dart';
import 'package:military_mobility_platform_frontend/service/toast.dart';
import 'package:military_mobility_platform_frontend/widgets/login/components.dart';
import 'package:provider/provider.dart';

class RegisterTab extends StatefulWidget {
  const RegisterTab({super.key});

  @override
  RegisterTabState createState() => RegisterTabState();

  void cancel() {}
}

class RegisterTabState extends State<RegisterTab> {
  static const kPermissions = {'일반사용자': 0, '수송 관리자': 1, '운전병': 2};

  final _formKey = GlobalKey<FormState>();
  String id = "";
  String name = "";
  String email = "";
  String baseName = "";
  String passwd = "";
  int permission = kPermissions.values.first;

  RegisterTabState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("회원가입"),
        ),
        body: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
            child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInputFields(context),
                      _buildRegisterButton(context),
                    ]))));
  }

  Widget _buildInputFields(BuildContext context) {
    final minHeight = MediaQuery.of(context).size.height * 0.7;
    return Container(
        constraints: BoxConstraints(minHeight: minHeight),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          buildTextFormField(
              setter: (val) => id = val ?? "",
              labelText: '아이디',
              helperText: '아이디를 입력해주세요'),
          buildTextFormField(
              setter: (val) => name = val ?? "",
              labelText: '이름',
              helperText: '이름을 입력해주세요'),
          buildTextFormField(
              setter: (val) => email = val ?? "",
              labelText: '이메일',
              helperText: '이메일을 입력해주세요',
              type: TextInputType.emailAddress),
          buildTextFormField(
              setter: (val) => baseName = val ?? "",
              labelText: '소속부대',
              helperText: '소속부대를 입력해주세요'),
          PasswordField(
            setter: (val) => passwd = val ?? "",
            labelText: '비밀번호',
            helperText: '비밀번호를 입력해주세요',
          ),
          _buildRoleDropDown(context),
        ]));
  }

  Widget _buildRoleDropDown(BuildContext context) {
    return DropdownButtonFormField(
        value: permission,
        items: kPermissions
            .map((key, val) =>
                MapEntry(key, DropdownMenuItem(value: val, child: Text(key))))
            .values
            .toList(),
        onChanged: (val) => permission = val ?? kPermissions.values.first);
  }

  Widget _buildRegisterButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _register(context),
      child: const Text('회원가입'),
    );
  }

  void _register(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    _formKey.currentState?.save();
    authProvider
        .register(
            id: id,
            password: passwd,
            email: email,
            battalionID: baseName,
            permission: permission)
        .then((success) {
      if (success) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (dialogContext) => AlertDialog(
                  title: const Text('관리자의 승인 이후에 로그인할 수 있습니다.'),
                  content: const Text('승인에는 2~3일정도 소요되며 승인 시 알림이 전송됩니다.'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(dialogContext);
                          Navigator.pop(context);
                        },
                        child: const Text('닫기'))
                  ],
                ));
      } else {
        Toast.showFailToast('회원가입에 실패했습니다.');
      }
    });
  }
}
