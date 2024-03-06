import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData prefixIcon;
  final Function(String) onChanged;
  TextInputType? keyboardType;
  String? errorText;
  bool? obscureText;
  TextEditingController? controller;
  Function? validator;

  CustomTextField(
      {Key? key,
      this.validator,
      required this.labelText,
      required this.hintText,
      required this.prefixIcon,
      required this.onChanged,
      this.keyboardType,
      this.errorText,
      this.obscureText,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType ?? TextInputType.emailAddress,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        prefixIcon: Icon(prefixIcon),
        hintText: hintText,
        labelText: labelText,
        errorText: errorText,
      ),
    );
  }
}
