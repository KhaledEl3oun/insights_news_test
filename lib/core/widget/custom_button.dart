import 'package:flutter/material.dart';
import 'package:insights_news/core/utils/text_style.dart';

class customButton extends StatelessWidget {
  const customButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backGroundColor = const Color(0xffBEDE61),
    this.forGround = const Color(0xff13140D),
  });
  final String text;
  final Function() onPressed;
  final Color backGroundColor;
  final Color forGround;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backGroundColor,
            foregroundColor: forGround,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
        onPressed: onPressed,
        child: Text(
          text,
          style: getbodyStyle(),
        ));
  }
}
