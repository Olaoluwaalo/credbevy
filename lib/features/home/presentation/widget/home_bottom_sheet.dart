import 'package:credbevy/core/constants/colors.dart';
import 'package:credbevy/core/constants/image_strings.dart';
import 'package:credbevy/features/home/presentation/widget/bottom_sheet_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeBottomSheet extends StatelessWidget {
  const HomeBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 10.h,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtomSheetButtons(
                image: CImages.chartIcon,
                text: "Analytics",
              ),
              SizedBox(
                width: 5.w,
              ),
              ButtomSheetButtons(
                onTap: () {
                  context.push("/sendMoneyScreen");
                },
                image: CImages.chartIcon1,
                text: "Send Money",
                buttonColor: CColors.buttonColor,
                textColor: CColors.scaffoldBackgroundColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
