import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/styling/app_text_styles.dart';
import 'package:news_app/core/widgets/spacing_widget.dart';
import 'package:news_app/features/home_screen/models/articles_model.dart';
import 'package:news_app/features/home_screen/services/home_screen_services.dart';
import 'package:news_app/features/home_screen/widgets/article_cart_widget.dart';
import 'package:news_app/features/home_screen/widgets/custom_category_item_widget.dart';
import 'package:news_app/features/home_screen/widgets/search_text_field_widget.dart';
import 'package:news_app/features/home_screen/widgets/top_headline_item_widget.dart';
import '../../core/styling/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 68.h,
        backgroundColor: const Color(0xffE9EEFA),
        title: Text("explore".tr(), style: AppTextStyles.primaryHeadlineStyle,),
        actions: [
          SearchTextFieldWidget(),
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
      ),
      body: FutureBuilder(
        future: HomeScreenServices().getTopHeadLinesArticles(),
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
                SizedBox(
                  height: 32.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsetsDirectional.only(start: 32.w),
                    children: [
                      CustomCategoryItemWidget(
                        title: 'travel'.tr(),
                        onTap: (){
                          GoRouter.of(context).pushNamed(AppRoutes.searchResultScreen, extra: 'travel'.tr());
                        },
                      ),
                      CustomCategoryItemWidget(
                        title: 'technology'.tr(),
                        onTap: (){
                          GoRouter.of(context).pushNamed(AppRoutes.searchResultScreen, extra: 'technology'.tr());
                        },
                      ),
                      CustomCategoryItemWidget(
                        title: 'business'.tr(),
                        onTap: (){
                          GoRouter.of(context).pushNamed(AppRoutes.searchResultScreen, extra: 'business'.tr());
                        },
                      ),
                      CustomCategoryItemWidget(
                        title: 'entertainment'.tr(),
                        onTap: (){
                          GoRouter.of(context).pushNamed(AppRoutes.searchResultScreen, extra: 'entertainment'.tr());
                        },
                      ),
                    ],
                  ),
                ),
                const HeightSpace(height: 24),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: TopHeadlineItemWidget(
                    imageUrl: topHeadLinesModel.articles![0].urlToImage,
                    title: topHeadLinesModel.articles![0].title ?? "",
                    authorName: topHeadLinesModel.articles![0].author ?? "",
                    date: DateFormat('yyyy-MM-dd - kk:mm').format(topHeadLinesModel.articles![0].publishedAt!),
                  ),
                ),
                const HeightSpace(height: 24),
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
