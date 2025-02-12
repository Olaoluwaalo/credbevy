import 'package:credbevy/common/texts.dart';
import 'package:credbevy/core/constants/image_strings.dart';
import 'package:credbevy/features/home/presentation/controllers/send_money_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FavoritesCard extends StatelessWidget {
  const FavoritesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 167.h,
      child: Consumer<SendMoneyController>(
        builder: (context, v, _) {
          // Check if beneficials is still empty
          if (v.beneficials.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: v.beneficials.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final i = v.beneficials[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                child: Container(
                  margin: const EdgeInsets.only(),
                  height: 167.h,
                  width: 137.w,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          backgroundImage: index == 1
                              ? AssetImage(CImages.image1)
                              : index == 2
                                  ? AssetImage(CImages.image32)
                                  : AssetImage(CImages.image4),
                        ),
                        lightText(
                          text: i.fullname,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        Icon(
                          Icons.star,
                          size: 20.r,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
