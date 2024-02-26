import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insights_news/core/services/apiServices.dart';
import 'package:insights_news/features/home/view-model/home_state.dart';

class NewsCubit extends Cubit<newsState> {
  NewsCubit() : super(newsInitState());

  getByCategory(String category) {
    emit(newsByCategoryloadingState());

    try {
      apiServices.getNewsByCategory(category).then((value) {
        emit(newsByCategorySucssesState(model: value!));
      });
    } catch (e) {
      emit(newsByCategoryerrorState(error: e.toString()));
    }
  }
// get search
  getBySearch(String search) {
    emit(newsSearchLoadingState());

    try {
      apiServices.getNewsBySearch(search).then((value) {
        emit(newsSearchSucssesState(model: value!));
      });
    } catch (e) {
      emit(newsSearchErrorState(error: e.toString()));
    }
  }
}
