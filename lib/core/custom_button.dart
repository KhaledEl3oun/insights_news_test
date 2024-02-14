import 'package:flutter/material.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/core/utils/appColors.dart';

class customButton extends StatelessWidget {
  const customButton({
    super.key,
    required this.onPressed,
    required this.text,
  });
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: appColors.containerBgColor,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(35))),
        onPressed: onPressed,
        child: Text(
          text,
          style: getbodyStyle(),
        ));
  }
}
