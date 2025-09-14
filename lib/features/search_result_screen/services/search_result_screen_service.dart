import 'dart:developer';
import 'package:news_app/features/home_screen/models/articles_model.dart';

import '../../../core/constants/constants.dart';
import '../../../core/networking/api_endpoints.dart';
import '../../../core/networking/dio_helper.dart';

class SearchResultScreenService{
  searchItemByName(String query)async{
    try{
      final response = await DioHelper.getRequest(
          endPoint: ApiEndPoints.searchEndPoint,
          query: {
            "apiKey" : AppConstants.newApiKeys,
            "q" : query,
            "language" : AppConstants.lang
          }
      );
      if(response.statusCode == 200){
        ArticlesModel articlesModel =
            ArticlesModel.fromJson(response.data);
        log(articlesModel.totalResults.toString());
        return articlesModel;
      }
    }catch(e){
      log(e.toString());
      return Future.error(e.toString());
    }
  }
}