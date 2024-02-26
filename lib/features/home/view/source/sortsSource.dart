import 'package:flutter/material.dart';
import 'package:insights_news/core/utils/appColors.dart';
import 'package:insights_news/core/widget/customListView.dart';

class sportsSource extends StatefulWidget {
  const sportsSource({
    super.key,
    required this.category,
  });
  final String category;
  @override
  State<sportsSource> createState() => _sportsSourceState();
}

class _sportsSourceState extends State<sportsSource> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.scaffColor,
      body: const Padding(
          padding: EdgeInsets.all(20),
          child: Expanded(child: custom_listView(category: 'sports'))),
    );
  }
}
