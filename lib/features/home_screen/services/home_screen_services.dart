import 'dart:developer';
import 'package:news_app/features/home_screen/models/articles_model.dart';

import '../../../core/constants/constants.dart';
import '../../../core/networking/api_endpoints.dart';
import '../../../core/networking/dio_helper.dart';

class HomeScreenServices{
  getTopHeadLinesArticles()async{
    try{
      final response = await DioHelper.getRequest(
          endPoint: ApiEndPoints.topHeadLinesEndPoints,
          query: {
            "apiKey" : AppConstants.newApiKeys,
            "country" : "us",
            // "language" : AppConstants.lang,
          }
      );
      if(response.statusCode == 200){
        ArticlesModel topHeadLinesModel =
            ArticlesModel.fromJson(response.data);
        log(topHeadLinesModel.totalResults.toString());
        return topHeadLinesModel;
      }
    }catch(e){
      log(e.toString());
      return Future.error(e.toString());
    }
  }
}