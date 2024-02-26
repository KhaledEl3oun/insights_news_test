import 'package:flutter/material.dart';
import 'package:insights_news/core/utils/appColors.dart';
import 'package:insights_news/core/widget/customListView.dart';

class techSource extends StatefulWidget {
  const techSource({
    super.key,
    required this.category,
  });
  final String category;
  @override
  State<techSource> createState() => _techSourceState();
}

class _techSourceState extends State<techSource> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.scaffColor,
      body: const Padding(
          padding: EdgeInsets.all(20),
          child: Expanded(child: custom_listView(category: 'technology'))),
    );
  }
}
