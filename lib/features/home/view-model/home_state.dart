import 'package:insights_news/features/home/data/news_model/news_model.dart';

class newsState {}

class newsInitState extends newsState {}

class newsByCategoryloadingState extends newsState {}

class newsByCategorySucssesState extends newsState {
  final NewsModel model;
  newsByCategorySucssesState({required this.model});
}
// by general

class newsByCategoryerrorState extends newsState {
  final String error;
  newsByCategoryerrorState({required this.error});
}
class newsByGeneralLoadingState extends newsState {}

class newsByGeneralSucssesState extends newsState {
  final NewsModel model;
  newsByGeneralSucssesState({required this.model});
}

class newsByGeneralerrorState extends newsState {
  final String error;
  newsByGeneralerrorState({required this.error});
}

// get search

class newsSearchLoadingState extends newsState {}

class newsSearchSucssesState extends newsState {
  final NewsModel model;
  newsSearchSucssesState({required this.model});
}

class newsSearchErrorState extends newsState {
  final String error;
  newsSearchErrorState({required this.error});
}
