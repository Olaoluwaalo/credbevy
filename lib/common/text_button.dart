import 'package:credbevy/common/texts.dart';
import 'package:credbevy/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CTextButton extends StatelessWidget {
  const CTextButton({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: lightText(
        text: text,
        color: CColors.buttonColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
