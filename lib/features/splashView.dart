import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/local_storge.dart';
import 'package:insights_news/features/home/view/navBar.dart';
import 'package:insights_news/core/navigator.dart';
import 'package:insights_news/core/utils/appColors.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/features/home/view/homeView.dart';
import 'package:insights_news/features/uploadView.dart';

class splashView extends StatefulWidget {
  const splashView({super.key});

  @override
  State<splashView> createState() => _splashViewState();
}

class _splashViewState extends State<splashView> {
  @override
  late bool isUpload;
  void initState() {
    super.initState();
    appLocal.getCacheData(appLocal.isUpload_key).then((value) {
      isUpload = value ?? false;
    });
    Future.delayed(
      const Duration(seconds: 3),
      () {
        routingWithReplaceMent(
            context, isUpload ? navBar() : const uploadView());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.scaffColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/splash.png'),
            Text(
              'Insights News',
              style: getTitleStyle(),
            ),
            const Gap(20),
            Text(
              'Stay Informed, Anytime, Anywhere.',
              style: getSmallStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
