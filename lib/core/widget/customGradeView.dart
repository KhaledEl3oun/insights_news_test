import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/utils/appColors.dart';
import 'package:insights_news/core/utils/text_style.dart';

class custom_grad_view extends StatelessWidget {
  const custom_grad_view({
    super.key,
    required this.text,
    required this.image,
  });
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: appColors.containerBgColor,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.asset(
              image,
              height: 125,
              width: 170,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(10),
          Text(
            text,
            style: getTitleStyle(),
          )
        ],
      ),
    );
  }
}
