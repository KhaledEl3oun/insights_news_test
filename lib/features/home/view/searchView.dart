import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/utils/appColors.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/core/widget/searchListView.dart';
import 'package:insights_news/features/home/view-model/home_cubit.dart';

class searchView extends StatefulWidget {
  const searchView({super.key});

  @override
  State<searchView> createState() => _searchViewState();
}

class _searchViewState extends State<searchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Find Your News',
          style: getTitleStyle(),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                context.read<NewsCubit>().getBySearch(value);
              },
              style: getSmallStyle(color: appColors.whiteColor),
              decoration: InputDecoration(
                  hintText: 'Search for news',
                  prefixIcon: Icon(
                    Icons.search,
                    color: appColors.whiteColor,
                    size: 30,
                  )),
            ),
            const Gap(20),
        
            const Expanded(child: searchListView()),
          ],
        ),
      )),
    );
  }
}
