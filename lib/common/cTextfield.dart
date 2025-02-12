import 'package:credbevy/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CTextfield extends StatelessWidget {
  const CTextfield({
    super.key,
    this.validator,
    this.controller,
    this.keyboardType,
    this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.prefixIcon, this.focusNode, this.inputFormatters, this.onEditingComplete,
  });
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final Widget? prefixIcon;
  
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onEditingComplete;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      onEditingComplete: onEditingComplete,
      obscureText: obscureText,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      selectionControls: DesktopTextSelectionControls(),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        prefixIconColor: Colors.grey,
        suffixIconColor: Colors.grey,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          color: Colors.grey,
          fontSize: 13.sp,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.r,
          ),
          borderSide: const BorderSide(
            color: CColors.borderColor,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: CColors.borderColor,
          ),
          borderRadius: BorderRadius.circular(
            10.r,
          ),
        ),
      ),
    );
  }
}
