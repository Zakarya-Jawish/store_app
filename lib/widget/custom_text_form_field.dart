import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.onChanged,
    this.validator,
    this.isPassword = false,
    this.colorHintText = Colors.grey,
  });
  final String? hintText;
  final Function(String)? onChanged;
  final bool Function(String)? validator;
  final bool isPassword;
  final Color colorHintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) return 'this field must be not empty';
        return null;
      },
      onChanged: onChanged,
      obscureText: isPassword,
      // style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: colorHintText),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.red)),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.black)),
      ),
    );
  }
}
