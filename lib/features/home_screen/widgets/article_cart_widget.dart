import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/features/home_screen/models/articles_model.dart';

import '../../../core/styling/app_text_styles.dart';
import '../../../core/widgets/spacing_widget.dart';
class ArticleCartWidget extends StatelessWidget {
  final Article article;
  const ArticleCartWidget({
    super.key,
    required this.article
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        GoRouter.of(context).pushNamed(
            AppRoutes.articleDetailsScreen, extra: article
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 24.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 238.w,
                    child: Text(
                      article.title ?? "",
                      style: AppTextStyles.subtitleStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const HeightSpace(height: 4),
                  SizedBox(
                    width: 238.w,
                    child: Text(
                      "${article.author} . ${article.publishedAt}",
                      style: AppTextStyles.grey12w400Style,
                    ),
                  )
                ],
            ),
            SizedBox(
              width: 112.w,
              height: 80.h,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage ??
                        "https://media.istockphoto.com/id/488693126/"
                            "photo/election-results-daily-newspaper"
                            "-headline.jpg?s=612x612&w=0&k=20&c=Owu"
                            "BWOL8D-BnaDjx57ZcJFI7ls1uB-dALWXLJVUI1VU=",
                    height: 80.h,
                    width: 112.w,
                    fit: BoxFit.fill,
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
