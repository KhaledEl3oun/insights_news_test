import 'package:flutter/material.dart';
import 'package:insights_news/core/utils/appColors.dart';
import 'package:insights_news/core/widget/customListView.dart';

class generalSource extends StatefulWidget {
  const generalSource({
    super.key,
    required this.category,
  });
  final String category;
  @override
  State<generalSource> createState() => _generalSourceState();
}

class _generalSourceState extends State<generalSource> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.scaffColor,
      body: const Padding(
          padding: EdgeInsets.all(20),
          child: Expanded(child: custom_listView(category: 'general'))),
    );
  }
}
