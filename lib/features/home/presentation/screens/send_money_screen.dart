import 'package:credbevy/common/cTextfield.dart';
import 'package:credbevy/common/generic_screen.dart';
import 'package:credbevy/common/texts.dart';
import 'package:credbevy/core/Helpers/validators.dart';
import 'package:credbevy/core/constants/image_strings.dart';
import 'package:credbevy/features/home/presentation/controllers/send_money_controller.dart';
import 'package:credbevy/features/home/presentation/widget/category_row.dart';
import 'package:credbevy/features/home/presentation/widget/favorites_card.dart';
import 'package:credbevy/features/home/presentation/widget/money_container.dart';
import 'package:credbevy/features/home/presentation/widget/send_money_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _referenceController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<SendMoneyController>(context, listen: false);
      provider.initializedData(context);
    });
  }

  // final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<SendMoneyController>(
      builder: (context, s, child) {
        return GenericScreen(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(CImages.homeIcon),
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          CImages.image4,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  lightText(
                    text: "Current Balance",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  boldText(
                    text: s.balanced.toString().isNotEmpty
                        ? "\$ ${s.balanced.toString()}"
                        : "Balance",
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  const CategoryRow(),
                  SizedBox(
                    height: 32.h,
                  ),
                  const FavoritesCard(),
                  SizedBox(
                    height: 24.h,
                  ),
                  _genTextField(
                      upperText: "Name",
                      hintText: "Walter White",
                      validator: Validators.validateField,
                      controller: _nameController),
                  SizedBox(
                    height: 16.h,
                  ),
                  _genTextField(
                      upperText: "Amount",
                      hintText: "How much do you want to send?",
                      controller: _amountController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d{0,2}$')),
                      ],
                      validator: Validators().validateTransactionAmount),
                  SizedBox(
                    height: 8.h,
                  ),
                  const MoneyContainer(),
                  SizedBox(
                    height: 16.h,
                  ),
                  _genTextField(
                      upperText: "Reference",
                      hintText: "What is this transsfer for?",
                      validator: Validators.validateField,
                      controller: _referenceController),
                  SizedBox(
                    height: 16.h,
                  ),
                  SendMoneyButton(
                      formKey: _formKey,
                      amountController: _amountController,
                      referenceController: _referenceController,
                      nameController: _nameController)
                ],
              ),
            )
          ],
        );
      },
    );
  }
}


_genTextField(
    {required String upperText,
    required String hintText,
    TextEditingController? controller,
    bool obscureText = false,
    Widget? suffixIcon,
    FocusNode? focusNode,
    List<TextInputFormatter>? inputFormatters,
    final void Function()? onEditingComplete,
    Widget? prefixIcon,
    double? height,
    String? Function(String?)? validator,
    TextInputType? keyboardType}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      boldText(text: upperText, fontWeight: FontWeight.w600, fontSize: 15.sp),
      SizedBox(
        height: height ?? 7.h,
      ),
      CTextfield(
        focusNode: focusNode,
        inputFormatters: inputFormatters,
        onEditingComplete: onEditingComplete,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        controller: controller,
        obscureText: obscureText,
        hintText: hintText,
        validator: validator,
        keyboardType: keyboardType,
      ),
    ],
  );
}
