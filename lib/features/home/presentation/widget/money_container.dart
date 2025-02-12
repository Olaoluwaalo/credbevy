import 'package:credbevy/common/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoneyContainer extends StatelessWidget {
  const MoneyContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> amount = ["+ 10", "+ 100", "- 10", "- 100"];
    return SizedBox(
      height: 35.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: amount.length,
        itemBuilder: (context, index) {
          final a = amount[index];
          return Container(
            margin: EdgeInsets.only(
              right: 8.w,
            ),
            padding: EdgeInsets.symmetric(
              // vertical: 10.h,
              horizontal: 11.w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                24.r,
              ),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: Center(
              child: lightText(
                text: a,
                fontSize: 15.sp,
              ),
            ),
          );
        },
      ),
    );
  }
}
