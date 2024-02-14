import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class navBar extends StatefulWidget {
  const navBar({super.key});

  @override
  State<navBar> createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/home.svg'), label: ''),
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/search.svg'), label: ''),
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/source.svg'), label: ''),
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/Profile.svg'), label: '')
      ]),
    );
  }
}
