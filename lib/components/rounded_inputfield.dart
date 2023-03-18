import 'package:disease_prediction/components/text_field_container.dart';
import 'package:flutter/material.dart';

import '../app/utils/contants.dart';


class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  const RoundedInputField({
    super.key,
    required this.hintText,
    this.icon = Icons.person,
    required this.controller,
    this.obscureText = false,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colours.kPrimaryColor,
          ),
          suffixIcon: obscureText
              ? const Icon(
                  Icons.visibility,
                  color: Colours.kPrimaryColor,
                )
              : null,
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
