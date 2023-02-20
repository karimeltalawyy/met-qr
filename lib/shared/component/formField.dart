import 'package:flutter/material.dart';

import 'constants/constants.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField({
    Key? key,
    required this.prefixIcon,
    required this.hintText,
    this.suffixIcon,
  }) : super(key: key);
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String hintText;
  final bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (query) {},
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: whiteColor,
        contentPadding: const EdgeInsets.all(0),
        hintText: hintText ?? 'ex.123123',
        hintStyle: TextStyle(
          fontSize: 16,
          color: Colors.grey.shade500,
        ),
        prefixIcon: Icon(prefixIcon ?? Icons.search),
        suffixIcon:
            isPassword ? Icon(suffixIcon ?? Icons.visibility_outlined) : null,
      ),
    );
  }
}
