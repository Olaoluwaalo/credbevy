import 'package:credbevy/common/generic_button.dart';
import 'package:credbevy/common/generic_screen.dart';
import 'package:credbevy/common/texts.dart';
import 'package:credbevy/core/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({
    super.key,
    required this.amount,
    required this.ref,
    required this.beneficiary,
  });
  final String amount;
  final String ref;
  final String beneficiary;
  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      children: [
        SizedBox(
          height: 155.h,
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                CImages.check,
              ),
              SizedBox(
                height: 105.h,
              ),
              boldText(
                text: '\$$amount',
                fontSize: 40.sp,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text.rich(TextSpan(children: [
                _textSpan(text: "Transfer successfully sent to "),
                _textSpan(text: beneficiary, fontWeight: FontWeight.bold),
              ])),
              lightText(
                text: "Ref: $ref",
                fontSize: 15.sp,
              )
            ],
          ),
        ),
        SizedBox(
          height: 200.h,
        ),
        CButton(
          buttonText: "Back",
          onTap: () {
            context.go("/homeScreen");
          },
        )
      ],
    );
  }
}

_textSpan({
  required String text,
  FontWeight? fontWeight,
  double? fontsize,
}) {
  return TextSpan(
      text: text,
      style: GoogleFonts.inter(
        fontSize: fontsize ?? 15.sp,
        fontWeight: fontWeight,
      ));
}
