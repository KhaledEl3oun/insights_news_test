import 'package:flutter/material.dart';
import 'package:insights_news/core/utils/appColors.dart';
import 'package:insights_news/core/widget/customListView.dart';

class enterSource extends StatefulWidget {
  const enterSource({
    super.key,
    required this.category,
  });
  final String category;
  @override
  State<enterSource> createState() => _enterSourceState();
}

class _enterSourceState extends State<enterSource> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.scaffColor,
      body: const Padding(
          padding: EdgeInsets.all(20),
          child: Expanded(child: custom_listView(category: 'entertainment'))),
    );
  }
}
