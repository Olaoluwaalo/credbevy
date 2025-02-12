import 'package:credbevy/common/texts.dart';
import 'package:credbevy/core/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _categoryContainer(
              icon: Icons.star,
              text: "Favorites",
            ),
            SizedBox(
              width: 16.w,
            ),
            _categoryContainer(
              icon: Icons.person_search,
              text: "All Friends",
            ),
          ],
        ),
        Image.asset(CImages.addButton)
      ],
    );
  }
}

_categoryContainer({
  required IconData icon,
  required String text,
}) {
  return Container(
    padding: EdgeInsets.symmetric(
      vertical: 8.h,
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
    child: Row(
      children: [
        Icon(
          icon,
          size: 13.sp,
        ),
        SizedBox(
          width: 5.w,
        ),
        lightText(
          text: text,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
      ],
    ),
  );
}