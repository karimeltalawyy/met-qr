import 'package:flutter/material.dart';

import 'constants/constants.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField({
    Key? key,
    required this.prefixIcon,
    required this.hintText,
    this.suffixIcon,
    this.validator,
    this.decoration,
    this.controller,
    this.fillColor,
    this.keyboardType,
    this.securePassword,
  }) : super(key: key);
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String hintText;
  final bool isPassword = false;
  final Function(String?)? validator;
  final InputDecoration? decoration;
  final TextEditingController? controller;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final bool? securePassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (val) {
        return validator!(val);
      },
      onChanged: (query) {},
      keyboardType: keyboardType,
      obscureText: securePassword ?? false,
      decoration: decoration ??
          InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(width: 1, color: Colors.white),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(width: 1, color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.white,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(width: 1, color: Colors.white),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15),
            ),
            filled: true,
            fillColor: fillColor ?? whiteColor,
            contentPadding: const EdgeInsets.all(0),
            hintText: hintText ,
            hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade500,
            ),
            prefixIcon: Icon(prefixIcon),
            suffixIcon: isPassword? IconButton(
              onPressed: () {},
              icon: const Icon(Icons.visibility_off),
            ): null,
          ),
    );
  }
}
