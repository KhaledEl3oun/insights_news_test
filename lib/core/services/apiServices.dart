import 'package:dio/dio.dart';
import 'package:insights_news/core/services/appConstants.dart';
import 'package:insights_news/features/home/data/news_model/news_model.dart';

class apiServices {
  // get category
  static Future<NewsModel?> getNewsByCategory(String category) async {
    try {
      var response = await Dio().get(
          '${appConstants.baseUrl}country=us&category=$category&apiKey=${appConstants.apiKey}');
      if (response.statusCode == 200) {
        NewsModel news = NewsModel.fromJson(response.data);
        return news;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Future<NewsModel?> getNewsBySearch(String search) async {
    try {
      var response = await Dio().get(
          '${appConstants.baseUrl}country=us&q=$search&apiKey=${appConstants.apiKey}');
      if (response.statusCode == 200) {
        NewsModel news = NewsModel.fromJson(response.data);
        return news;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
  static Future<NewsModel?> getNewsBysource(String source) async {
    try {
      var response = await Dio().get(
          '${appConstants.baseUrl}country=us&souece=$source&apiKey=${appConstants.apiKey}');
      if (response.statusCode == 200) {
        NewsModel news = NewsModel.fromJson(response.data);
        return news;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
