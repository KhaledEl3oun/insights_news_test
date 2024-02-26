import 'package:flutter/material.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/core/widget/customGradeView.dart';
import 'package:insights_news/features/home/view/source/businessSource.dart';
import 'package:insights_news/features/home/view/source/enterSource.dart';
import 'package:insights_news/features/home/view/source/generalSource.dart';
import 'package:insights_news/features/home/view/source/healthSource.dart';
import 'package:insights_news/features/home/view/source/scienceSource.dart';
import 'package:insights_news/features/home/view/source/sortsSource.dart';
import 'package:insights_news/features/home/view/source/techSource.dart';

class sourceView extends StatefulWidget {
  const sourceView({super.key});

  @override
  State<sourceView> createState() => _sourceViewState();
}

class _sourceViewState extends State<sourceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Source',
            style: getTitleStyle(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const sportsSource(
                                    category: 'sports',
                                  )));
                    },
                    child: const custom_grad_view(
                        text: 'SPORTS', image: 'assets/sports.jpg'),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const scienceSource(
                                    category: 'science',
                                  )));
                    },
                    child: const custom_grad_view(
                        text: 'SCIENCE', image: 'assets/science.jpg'),
                  ),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const enterSource(
                                    category: 'entertainment',
                                  )));
                    },
                    child: const custom_grad_view(
                        text: 'ENTERTAINMENT', image: 'assets/enter.jpg'),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const businessSource(
                                    category: 'business',
                                  )));
                    },
                    child: const custom_grad_view(
                        text: 'BUSINESS', image: 'assets/business.jpg'),
                  ),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const healthSource(
                                    category: 'health',
                                  )));
                    },
                    child: const custom_grad_view(
                        text: 'HEALTH', image: 'assets/health.jpg'),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const techSource(
                                    category: 'technology',
                                  )));
                    },
                    child: const custom_grad_view(
                        text: 'TECHNOLOGY', image: 'assets/tech.jpg'),
                  ),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const generalSource(
                                    category: 'genaral',
                                  )));
                    },
                    child: const custom_grad_view(
                        text: 'GENERAL', image: 'assets/general.jpg'),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
