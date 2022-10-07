import 'package:flutter/material.dart';

Widget buildTextFormField(
    {void Function(String?)? setter,
    String? labelText,
    String? helperText,
    TextInputType type = TextInputType.text}) {
  return SizedBox(
      height: 80.0,
      child: TextFormField(
        keyboardType: type,
        decoration: InputDecoration(
          labelText: labelText,
          helperText: helperText,
        ),
        onSaved: setter,
      ));
}

Widget buildVerticalPadding(double size) {
  return Padding(padding: EdgeInsets.only(top: size));
}

class PasswordField extends StatefulWidget {
  final void Function(String?)? setter;
  final String? labelText;
  final String? helperText;
  const PasswordField(
      {this.setter, this.labelText, this.helperText, super.key});

  @override
  PasswordFieldState createState() => PasswordFieldState();
}

class PasswordFieldState extends State<PasswordField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100.0,
        child: TextFormField(
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              labelText: widget.labelText,
              helperText: widget.helperText,
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                  icon: Icon(_isPasswordVisible
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () => setState(
                      () => _isPasswordVisible = !_isPasswordVisible))),
          onSaved: widget.setter,
        ));
  }
}
