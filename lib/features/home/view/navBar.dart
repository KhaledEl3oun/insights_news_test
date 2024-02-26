import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insights_news/core/utils/appColors.dart';
import 'package:insights_news/features/home/view/homeView.dart';
import 'package:insights_news/features/home/view/profile/profileView.dart';
import 'package:insights_news/features/home/view/searchView.dart';
import 'package:insights_news/features/home/view/sourceView.dart';

class navBar extends StatefulWidget {
  const navBar({super.key});

  @override
  State<navBar> createState() => _navBarState();
}

List<Widget> screens = [
  const homeView(),
  const searchView(),
  const sourceView(),
  const profileView()
];
int _index = 0;

class _navBarState extends State<navBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (value) {
            setState(() {
              _index = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/home.svg'),
                activeIcon: SvgPicture.asset(
                  'assets/home.svg',
                  colorFilter: ColorFilter.mode(
                      appColors.lemonadaColor, BlendMode.srcIn),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/search.svg',
                ),
                activeIcon: SvgPicture.asset(
                  'assets/search.svg',
                  colorFilter: ColorFilter.mode(
                      appColors.lemonadaColor, BlendMode.srcIn),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/source.svg'),
                activeIcon: SvgPicture.asset(
                  'assets/source.svg',
                  colorFilter: ColorFilter.mode(
                      appColors.lemonadaColor, BlendMode.srcIn),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/Profile.svg'),
                activeIcon: SvgPicture.asset(
                  'assets/Profile.svg',
                  colorFilter: ColorFilter.mode(
                      appColors.lemonadaColor, BlendMode.srcIn),
                ),
                label: '')
          ]),
    );
  }
}
