import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styling/app_colors.dart';
import 'package:news_app/core/styling/app_text_styles.dart';
import 'package:news_app/features/search_result_screen/services/search_result_screen_service.dart';
import '../../core/constants/constants.dart';
import '../../core/widgets/spacing_widget.dart';
import '../home_screen/models/articles_model.dart';
import '../home_screen/widgets/article_cart_widget.dart';
import '../home_screen/widgets/search_text_field_widget.dart';

class SearchResultScreen extends StatelessWidget {
  final String query;
  const SearchResultScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        title: Text(
          "search_results".tr(),
          style: AppTextStyles.subtitleStyle,
        ),
        actions: [
          IconButton(
              onPressed: (){
                if(context.locale.languageCode == "en"){
                  context.setLocale(Locale("ar"));
                }else{
                  context.setLocale(Locale("en"));
                }
                AppConstants.lang = context.locale.languageCode;
              },
              icon: Icon(
                Icons.language,
                color: AppColors.primaryColor,
              )
          )
        ],
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: SearchResultScreenService().searchItemByName(query),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            }
            if(snapshot.hasError){
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if(snapshot.hasData){
              ArticlesModel topHeadLinesModel = snapshot.data! as ArticlesModel;
              if(topHeadLinesModel.totalResults == 0){
                return Center(child: Text("no results".tr()),);
              }

              return Column(
                children: [
                  const HeightSpace(height: 16),
                  // Expanded ListView for articles
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        child: ListView.builder(
                            itemCount: topHeadLinesModel.articles!.length,
                            itemBuilder: (context, index){
                              Article article = topHeadLinesModel.articles![index];
                              return ArticleCartWidget(
                                article: article,
                              );
                            })
                    ),
                  ),
                ],
              );
            }
            return Center(child: Text("Something Went Wrong"),);
          }
      ),
    );
  }
}
