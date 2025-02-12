import 'package:credbevy/common/text_button.dart';
import 'package:credbevy/common/texts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

genericDialog({
  required BuildContext context,
  required String contentText,
  void Function()? onPressed,
  String? title,
  List<Widget>? actions,
}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        
        title: boldText(text:title?? 'Error Occurred'),
        content: lightText(
          text: contentText,
        ),
        actions:actions?? [
          CTextButton(
            text: "Okay",
            onPressed:onPressed?? () {
              context.pop();
            },
          )
        ],
      );
    },
  );
}
