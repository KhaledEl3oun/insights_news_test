import 'package:flutter/material.dart';
import 'package:insights_news/core/utils/appColors.dart';
import 'package:insights_news/features/splashView.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: appColors.scaffColor,
            appBarTheme: AppBarTheme(backgroundColor: appColors.scaffColor),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: appColors.scaffColor),
            inputDecorationTheme: InputDecorationTheme(
                hintStyle: TextStyle(color: appColors.whiteColor),
                fillColor: appColors.containerBgColor,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ))),
        home: const splashView());
  }
}
