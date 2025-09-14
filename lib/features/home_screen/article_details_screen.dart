import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styling/app_text_styles.dart';
import 'package:news_app/core/widgets/spacing_widget.dart';
import 'package:news_app/features/home_screen/models/articles_model.dart';

import '../../core/styling/app_colors.dart';
class ArticleDetailsScreen extends StatelessWidget {
  final Article article;
  const ArticleDetailsScreen({
    super.key,
    required this.article
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            SizedBox(
              width: 430.w,
              height: 316.h,
              child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? ""
              ),
            ),
            Positioned(
              top: 230.h,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                padding: EdgeInsets.only(top: 24.h, right: 16.w, left: 16.w,),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24.r)
                  )
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title ?? "",
                        style: AppTextStyles.subtitleStyle,
                      ),
                      const HeightSpace(height: 8),
                      Text(
                        "${article.author} . ${
                            DateFormat('yyyy-MM-dd - kk:mm').format(article.publishedAt!)
                        }"
                      ),
                      const HeightSpace(height: 24),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text(
                          article.description.toString(),
                          style: AppTextStyles.black16w400Style,
                        ),
                      )
                    ],
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
