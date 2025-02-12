import 'package:credbevy/common/generic_button.dart';
import 'package:credbevy/common/texts.dart';
import 'package:credbevy/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtomSheetButtons extends StatelessWidget {
  const ButtomSheetButtons({
    super.key,
    required this.image,
    required this.text,
    this.buttonColor,
    this.textColor, this.onTap,
  });
  final String image;
  final String text;
  final dynamic Function()? onTap;
  final Color? buttonColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: CButton(
      onTap: onTap,
      border: Border.all(
        color: CColors.borderColor,
      ),
      buttonText: "",
      buttonColor: buttonColor ?? CColors.scaffoldBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          SizedBox(
            width: 7.w,
          ),
          boldText(
            text: text,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: textColor ?? CColors.buttonColor,
          ),
        ],
      ),
    ));
  }
}
