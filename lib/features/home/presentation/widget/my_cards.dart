
import 'package:credbevy/core/constants/colors.dart';
import 'package:credbevy/features/home/presentation/controllers/home_controller.dart';
import 'package:credbevy/features/home/presentation/widget/card_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCards extends StatelessWidget {
  const MyCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final v = Provider.of<HomeController>(context, listen: false);
    return SizedBox(
      height: 187,
      child: ListView.builder(
        itemCount: v.creditCards.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final cardDetails = v.creditCards[index];
          final cardColor =
              (index == 1) ? CColors.gradientColor2 : CColors.gradientColor1;
          return CardContainer(
            properties: CardProperties(
              bankName: cardDetails.bankName,
              cardName: cardDetails.name,
              cardColor: cardColor,
              cardNumber: cardDetails.cardNumber,
              expiryDate: cardDetails.expiryDate,
            ),
          );
        },
      ),
    );
  }
}
