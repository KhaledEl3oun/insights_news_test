import 'package:flutter/material.dart';
import 'package:insights_news/core/utils/appColors.dart';
import 'package:insights_news/core/widget/customListView.dart';

class healthSource extends StatefulWidget {
  const healthSource({
    super.key,
    required this.category,
  });
  final String category;
  @override
  State<healthSource> createState() => _healthSourceState();
}

class _healthSourceState extends State<healthSource> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.scaffColor,
      body: const Padding(
          padding: EdgeInsets.all(20),
          child: Expanded(child: custom_listView(category: 'health'))),
    );
  }
}
