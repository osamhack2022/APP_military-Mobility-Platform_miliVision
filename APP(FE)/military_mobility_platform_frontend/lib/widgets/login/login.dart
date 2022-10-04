import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/provider/auth.dart';
import 'package:military_mobility_platform_frontend/service/toast.dart';
import 'package:military_mobility_platform_frontend/widgets/login/components.dart';
import 'package:military_mobility_platform_frontend/widgets/login/register.dart';
import 'package:provider/provider.dart';

class LoginTab extends StatefulWidget {
  const LoginTab({super.key});

  @override
  LoginTabState createState() => LoginTabState();
}

class LoginTabState extends State<LoginTab> {
  final _formKey = GlobalKey<FormState>();
  String id = "";
  String passwd = "";

  LoginTabState();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: Column(children: [
                buildTextFormField(
                    setter: (val) => id = val ?? "",
                    labelText: '아이디',
                    helperText: '아이디를 입력해주세요'),
                buildVerticalPadding(25.0),
                PasswordField(
                    setter: (val) => passwd = val ?? "",
                    labelText: '비밀번호',
                    helperText: '비밀번호를 입력해주세요'),
                buildVerticalPadding(60.0),
                _buildLoginButton(context),
                buildVerticalPadding(25.0),
                _buildRegisterButton(context),
                buildVerticalPadding(150.0),
              ]),
            ))
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return ElevatedButton(
      child: const Text('로그인'),
      onPressed: () async {
        _formKey.currentState?.save();
        final success = await authProvider.login(id: id, password: passwd);
        if (success) {
          Toast.showSuccessToast('로그인에 성공하였습니다.');
        } else {
          Toast.showFailToast('로그인에 실패하였습니다. 다시 시도해주십시오.');
        }
      },
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return TextButton(
        onPressed: () => showBottomSheet(
            context: context, builder: (context) => const RegisterTab()),
        child: const Text('회원가입'));
  }
}
