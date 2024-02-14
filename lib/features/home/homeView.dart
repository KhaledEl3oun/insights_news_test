import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/header.dart';
import 'package:insights_news/core/utils/appColors.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class homeView extends StatefulWidget {
  const homeView({super.key});

  @override
  State<homeView> createState() => _homeViewState();
}

int pageIndex = 0;

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
                          'assets/img.png',
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
                      autoPlay: false,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
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
                        dotHeight: 10,
                        dotWidth: 10), // your preferred effect
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
                Expanded(
                    child: TabBarView(
                  children: [
                    const Icon(Icons.add_chart_outlined),
                    const Icon(Icons.abc_rounded),
                    (ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              color: appColors.containerBgColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/img.png',
                                  height: 110,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Gap(10),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      'Man City stay perfect despite Rodri red against Forest',
                                      style: getSmallStyle(
                                          color: appColors.whiteColor,
                                          fontSize: 12),
                                    ),
                                    const Gap(30),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.menu,
                                          color: appColors.whiteColor,
                                          size: 17,
                                        ),
                                        Text(
                                          'READ',
                                          style: getSmallStyle(
                                              color: appColors.whiteColor,
                                              fontSize: 10),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    )),
                    const Icon(Icons.accessibility_new),
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
