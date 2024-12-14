import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GTextFormField extends StatelessWidget {
  final TextInputType? textInputType;
  final String hintText;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;

  const GTextFormField(
      {super.key,
      this.textInputType,
      required this.hintText,
      this.prefixIcon,
      this.obscureText = false,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscureText,
        controller: controller,
        keyboardType: textInputType,
        style: GoogleFonts.poppins(),
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(),
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 194, 193, 193)),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(20),
            )));
  }
}
