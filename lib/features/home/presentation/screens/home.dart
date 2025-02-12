import 'package:credbevy/common/generic_screen.dart';
import 'package:credbevy/common/texts.dart';
import 'package:credbevy/core/constants/image_strings.dart';
import 'package:credbevy/features/home/presentation/controllers/home_controller.dart';
import 'package:credbevy/features/home/presentation/widget/home_bottom_sheet.dart';
import 'package:credbevy/features/home/presentation/widget/my_cards.dart';
import 'package:credbevy/features/home/presentation/widget/transaction_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<HomeController>(context, listen: false);
      provider.initializedData(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, v, child) {
        return GenericScreen(
          crossAxisAlignment: CrossAxisAlignment.start,
          bottomSheet: const HomeBottomSheet(),
          children: [
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(CImages.moreIcon),
                CircleAvatar(
                  backgroundImage: AssetImage(CImages.image4),
                )
              ],
            ),
            SizedBox(height: 32.h),
            boldText(
              text: 'My Cards',
              fontSize: 26.sp,
            ),
            SizedBox(height: 16.h),
            if (v.creditCards.isNotEmpty)
              const MyCards()
            else
              const Center(
                child: CircularProgressIndicator(),
              ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                lightText(
                  text: "Transaction History",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                Image.asset(CImages.filterIcon),
              ],
            ),
            SizedBox(height: 22.h),
            if (v.expenses.isNotEmpty)
              const TransactionHistory()
            else
              const Center(
                child: CircularProgressIndicator(),
              ),
            SizedBox(height: 60.h),
          ],
        );
      },
    );
  }
}

