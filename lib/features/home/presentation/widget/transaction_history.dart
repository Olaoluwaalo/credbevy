import 'package:credbevy/core/constants/image_strings.dart';
import 'package:credbevy/features/home/presentation/controllers/home_controller.dart';
import 'package:credbevy/features/home/presentation/widget/transaction_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final v = Provider.of<HomeController>(context, listen: false);
    return ListView.builder(
      itemCount: v.expenses.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final t = v.expenses[index];
        final image = (index == 0)
            ? CImages.uber
            : (index == 1)
                ? CImages.spotify
                : (index == 2)
                    ? CImages.netflix
                    : null;
        final title = (index == 0)
            ? "Uber Ride"
            : (index == 1)
                ? "Spotify Subscription"
                : (index == 2)
                    ? "Netflix Account"
                    : "Starbucks Coffee";
        return TransactionTile(
          p: TransactionTileProperties(
            amountSpent: t.amountSpent.toString(),
            month: t.month,
            image: image,
            title: title,
          ),
        );
      },
    );
  }
}
