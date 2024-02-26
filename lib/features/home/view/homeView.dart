import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/utils/appColors.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/core/widget/customListView.dart';
import 'package:insights_news/core/widget/header.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class homeView extends StatefulWidget {
  const homeView({super.key});

  @override
  State<homeView> createState() => _homeViewState();
}

int pageIndex = 0;
final List images = [
  'assets/business.jpg',
  'assets/sports.jpg',
  'assets/science.jpg',
  'assets/enter.jpg',
  'assets/news.jpg',
];

class _homeViewState extends State<homeView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const header(),
                const Gap(20),
                CarouselSlider.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          images[itemIndex],
                          height: 160,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: 160,
                      aspectRatio: 10 / 9,
                      viewportFraction: 1,
                      initialPage: 5,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 6),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 1500),
                      autoPlayCurve: Curves.decelerate,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      onPageChanged: (index, reason) {
                        setState(() {
                          pageIndex = index;
                        });
                      },
                    )),
                const Gap(10),
                SmoothPageIndicator(
                    controller: PageController(
                        initialPage: pageIndex), // PageController
                    count: 5,
                    effect: ScrollingDotsEffect(
                        dotColor: appColors.containerBgColor,
                        activeDotColor: appColors.lemonadaColor,
                        dotHeight: 7,
                        dotWidth: 7), // your preferred effect
                    onDotClicked: (index) {}),
                const Gap(20),
                ButtonsTabBar(
                  // Customize the appearance and behavior of the tab bar
                  backgroundColor: appColors.lemonadaColor,
                  labelStyle: getSmallStyle(color: Colors.black),
                  unselectedBackgroundColor: appColors.containerBgColor,

                  unselectedLabelStyle:
                      getSmallStyle(color: appColors.whiteColor),
                  borderColor: Colors.black,
                  // buttonMargin: const EdgeInsets.only(left: 15),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),

                  tabs: const [
                    Tab(
                      text: 'Science',
                    ),
                    Tab(
                      text: 'Entertainment',
                    ),
                    Tab(
                      text: 'Sports',
                    ),
                    Tab(
                      text: 'Business',
                    ),
                  ],
                ),
                const Gap(20),
                const Expanded(
                    child: TabBarView(
                  children: [
                    custom_listView(
                      category: 'science',
                    ),
                    custom_listView(
                      category: 'entertainment',
                    ),
                    custom_listView(
                      category: 'sports',
                    ),
                    custom_listView(
                      category: 'business',
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
