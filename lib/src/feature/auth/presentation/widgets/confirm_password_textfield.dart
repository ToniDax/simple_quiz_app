
import 'package:flutter/material.dart';

class ConfirmPasswordTextField extends StatelessWidget {
  const ConfirmPasswordTextField({
    super.key,
    required this.passwordController,
    required this.passwordIsVisible,
    this.onPressedIcon,
    this.onChanged,
    this.onSubmitted,
  });

  final TextEditingController passwordController;
  final bool passwordIsVisible;
  final VoidCallback? onPressedIcon;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: TextField(
        controller: passwordController,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        obscureText: passwordIsVisible,
        cursorColor: Colors.black,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: "Confirm Password",
          hintStyle: const TextStyle(
              color: Colors.black
          ),
          suffixIcon: IconButton(
            icon: Icon(
              passwordIsVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.black,
            ),
            onPressed: onPressedIcon,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: Colors.grey[200],
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.grey.shade700),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
