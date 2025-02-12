import 'package:credbevy/common/texts.dart';
import 'package:credbevy/core/constants/colors.dart';
import 'package:credbevy/core/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardProperties {
  final String bankName;
  final String cardNumber;
  final String cardName;
  final String expiryDate;
  final List<Color> cardColor;

  CardProperties( {
    required this.cardColor,
    required this.bankName,
    required this.cardNumber,
    required this.cardName,
    required this.expiryDate,
  });
}

class CardContainer extends StatelessWidget {
  const CardContainer({
    super.key,
    required this.properties,
  });
  final CardProperties properties;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 16.w,
      ),
      height: 187.h,
      width: 270.w,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          23.r,
        ),
        gradient:  LinearGradient(
            colors:properties.cardColor,
            begin: Alignment.bottomLeft,
            end: Alignment.topRight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              lightText(
                text: properties.bankName,
                fontSize: 14.sp,
                color: CColors.scaffoldBackgroundColor,
              ),
              Image.asset(
                CImages.cardLogo,
              )
            ],
          ),
          boldText(
            text: properties.cardNumber,
            fontSize: 20.sp,
            color: CColors.scaffoldBackgroundColor,
            fontWeight: FontWeight.w400,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _cardNameAndExpiryColumn(
                  upperText: "NAME", lowerText: properties.cardName),
              _cardNameAndExpiryColumn(
                upperText: "EXPIRY",
                lowerText: properties.expiryDate,
              )
            ],
          )
        ],
      ),
    );
  }
}

_cardNameAndExpiryColumn(
    {required String upperText, required String lowerText}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      lightText(
        text: upperText,
        color: CColors.scaffoldBackgroundColor,
        fontSize: 10.sp,
      ),
      lightText(
        text: lowerText,
        color: CColors.scaffoldBackgroundColor,
        fontSize: 14.sp,
      ),
    ],
  );
}
