import 'package:flutter/material.dart';
import '../constant/theme.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Widget suffixIcon;
  final TextEditingController controller;
  final TextInputType type;
  final String? Function(String?)? validator;

  const InputField({
    Key? key,
    required this.hintText,
    this.obscureText = false,
    required this.suffixIcon,
    required this.controller,
    this.type = TextInputType.text,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: validator != null
          ? const EdgeInsets.only(bottom: 5, top: 5)
          : const EdgeInsets.only(bottom: 0, top: 0),
      decoration: BoxDecoration(
        color: kWhiteGrey,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: type,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: greyTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 16,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
