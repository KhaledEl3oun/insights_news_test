import 'package:flutter/material.dart';
import 'package:insights_news/core/utils/appColors.dart';
import 'package:insights_news/core/widget/customListView.dart';

class scienceSource extends StatefulWidget {
  const scienceSource({
    super.key,
    required this.category,
  });
  final String category;
  @override
  State<scienceSource> createState() => _scienceSourceState();
}

class _scienceSourceState extends State<scienceSource> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.scaffColor,
      body: const Padding(
          padding: EdgeInsets.all(20),
          child: Expanded(child: custom_listView(category: 'science'))),
    );
  }
}
