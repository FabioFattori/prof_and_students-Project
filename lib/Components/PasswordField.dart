import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  PasswordField({Key? key, required this.label, required this.controller})
      : super(key: key);

  late String label;
  late TextEditingController controller;

  bool showPassword = true;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      
      controller: widget.controller,
      obscureText: widget.showPassword,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: widget.label,
        suffixIcon: IconButton(
          icon: Icon(
            widget.showPassword ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              widget.showPassword = !widget.showPassword;
            });
          },
        ),
      ),
    );
  }
}
