
import 'package:credbevy/common/generic_button.dart';
import 'package:credbevy/common/texts.dart';
import 'package:credbevy/core/constants/colors.dart';
import 'package:credbevy/core/constants/image_strings.dart';
import 'package:credbevy/features/home/presentation/controllers/send_money_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SendMoneyButton extends StatelessWidget {
  const SendMoneyButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController amountController,
    required TextEditingController referenceController,
    required TextEditingController nameController,
  })  : _formKey = formKey,
        _amountController = amountController,
        _referenceController = referenceController,
        _nameController = nameController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _amountController;
  final TextEditingController _referenceController;
  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    final s = Provider.of<SendMoneyController>(context, listen: false);
    return CButton(
      onTap: () async {
        if (_formKey.currentState!.validate()) {
          await s.sendMoney(
            context: context,
            amount: double.parse(
              _amountController.text.trim(),
            ),
          );

          // ignore: use_build_context_synchronously
          context.push(
            '/receiptScreen/${_amountController.text}/${_referenceController.text}/${_nameController.text}',
          );
        }
      },
      border: Border.all(
        color: CColors.borderColor,
      ),
      buttonText: "",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            CImages.chartIcon1,
          ),
          SizedBox(
            width: 10.w,
          ),
          boldText(
            text: "Send Money",
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: CColors.scaffoldBackgroundColor,
          ),
        ],
      ),
    );
  }
}