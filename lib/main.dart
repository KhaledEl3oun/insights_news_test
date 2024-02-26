import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insights_news/core/utils/appColors.dart';
import 'package:insights_news/features/home/view-model/home_cubit.dart';
import 'package:insights_news/features/splashView.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: appColors.scaffColor,
              appBarTheme: AppBarTheme(backgroundColor: appColors.scaffColor),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: appColors.lemonadaColor,
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
                backgroundColor: appColors.scaffColor,
                showSelectedLabels: false,
                showUnselectedLabels: false,
              ),
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
          home: const splashView()),
    );
  }
}
