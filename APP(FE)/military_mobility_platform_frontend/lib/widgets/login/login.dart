import 'package:flutter/material.dart';
import 'package:military_mobility_platform_frontend/provider/auth.dart';
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
  bool _isPasswordVisible = false;

  LoginTabState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: Column(children: [
                _buildIDField(),
                Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: _buildPasswdField()),
                Padding(
                    padding: const EdgeInsets.only(top: 35.0),
                    child: _buildLoginButton(context)),
                Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: _buildRegisterButton(context)),
                const Padding(padding: EdgeInsets.only(top: 150.0)),
              ]),
            ))
      ],
    ));
  }

  Widget _buildIDField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: '아이디',
        helperText: '아이디를 입력해주세요',
        border: OutlineInputBorder(),
      ),
      onSaved: (String? value) {
        id = value ?? "";
      },
    );
  }

  Widget _buildPasswdField() {
    return TextFormField(
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
          labelText: '비밀번호',
          helperText: '비밀번호를 입력해주세요',
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
              icon: Icon(
                  _isPasswordVisible ? Icons.visibility_off : Icons.visibility),
              onPressed: () =>
                  setState(() => _isPasswordVisible = !_isPasswordVisible))),
      onSaved: (String? value) {
        passwd = value ?? "";
      },
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return ElevatedButton(
      child: const Text('로그인'),
      onPressed: () {
        _formKey.currentState?.save();
        print('login (id: $id, pwd: $passwd)');
        authProvider.login(id, passwd);
      },
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return TextButton(
        onPressed: () => print('show register tab'), child: const Text('회원가입'));
  }
}
