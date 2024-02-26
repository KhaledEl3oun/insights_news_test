import 'package:flutter/material.dart';
import 'package:insights_news/core/utils/appColors.dart';
import 'package:insights_news/core/widget/customListView.dart';

class businessSource extends StatefulWidget {
  const businessSource({
    super.key,
    required this.category,
  });
  final String category;
  @override
  State<businessSource> createState() => _businessSourceState();
}

class _businessSourceState extends State<businessSource> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.scaffColor,
      body: const Padding(
          padding: EdgeInsets.all(20),
          child: Expanded(child: custom_listView(category: 'business'))),
    );
  }
}
