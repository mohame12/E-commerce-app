import 'package:e_commerce_app/style/colors.dart';
import 'package:flutter/material.dart';

class DefTff extends StatelessWidget {
  const DefTff({
    Key? key,
    required this.controller,
    this.validator,
    this.keyboardType,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.obscureText,
    this.labelText,
    this.onChanged,
    this.onFieldSubmitted,
  }) : super(key: key);

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? hintText;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final bool obscureText;
  final String? labelText;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      onChanged:onChanged ,
      onFieldSubmitted:onFieldSubmitted ,
      maxLines: 1,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon ,
        suffixIcon: suffixIcon ,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide(color: defColor),
        ),

      ),
    );
  }
}
