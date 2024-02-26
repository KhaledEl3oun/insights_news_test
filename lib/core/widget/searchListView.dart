import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/utils/appColors.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/features/home/data/news_model/news_model.dart';
import 'package:insights_news/features/home/view-model/home_cubit.dart';
import 'package:insights_news/features/home/view-model/home_state.dart';

class searchListView extends StatelessWidget {
  const searchListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, newsState>(
      builder: (context, state) {
        if (state is newsSearchErrorState) {
          return Text(state.error);
        } else if (state is newsSearchSucssesState) {
          NewsModel news = state.model;
          return Column(
            children: [
              Row(
                children: [
                  Text(
                    'Total Results: ${news.articles?.length}',
                    style: getbodyStyle(),
                  ),
                ],
              ),
              const Gap(10),
              Expanded(
                child: ListView.builder(
                  itemCount: news.articles?.length,
                  itemBuilder: (context, index) {
                    var newsItem = news.articles?[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: appColors.containerBgColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              newsItem?.urlToImage ?? '',
                              height: 100,
                              width: 150,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const SizedBox(
                                    width: 150,
                                    height: 110,
                                    child: Icon(Icons.error));
                              },
                            ),
                          ),
                          const Gap(10),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  newsItem?.title ?? '',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
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
                ),
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
