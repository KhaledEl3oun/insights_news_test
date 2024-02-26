import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/utils/appColors.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/core/widget/custom_button.dart';
import 'package:insights_news/features/home/data/news_model/article.dart';
import 'package:url_launcher/url_launcher.dart';

class newsDet extends StatelessWidget {
  const newsDet({super.key, required this.model});
  final Article model;

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(model.url ?? ''))) {
      throw Exception('Could not launch');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: appColors.whiteColor,
            )),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: customButton(
          backGroundColor: appColors.lemonadaColor,
          forGround: appColors.scaffColor,
          onPressed: () {
            _launchUrl();
          },
          text: 'Go To Website',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  model.urlToImage ?? '',
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      child: const Icon(Icons.error),
                    );
                  },
                ),
              ),
              const Gap(10),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      model.title ?? '',
                      style: getTitleStyle(),
                    ),
                  ),
                ],
              ),
              const Gap(7),
              Row(
                children: [
                  Text(
                    model.author?.split('T')[0] ?? '',
                    style: getbodyStyle(color: appColors.lemonadaColor),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    model.publishedAt?.split('T')[0] ?? '',
                    style: getSmallStyle(),
                  ),
                ],
              ),
              const Gap(25),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      model.description ?? '',
                      style: getbodyStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
