import 'package:credbevy/common/texts.dart';
import 'package:credbevy/core/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionTileProperties {
  final String month;
  final String amountSpent;
  final String? image;
  final String? title;

  TransactionTileProperties({
    required this.month,
    required this.amountSpent,
    this.image,
    this.title,
  });
}

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    required this.p,
  });
  final TransactionTileProperties p;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          vertical: 15.h,
          horizontal: 10.w,
        ),
        leading: Image.asset(
          p.image ?? CImages.starBucks,
        ),
        title: boldText(
          text: p.title ?? "Uber Ride",
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        subtitle: lightText(
          text: p.month,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        trailing: boldText(
          text: "\$ ${p.amountSpent}",
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
