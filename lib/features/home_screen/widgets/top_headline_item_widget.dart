import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styling/app_text_styles.dart';
import 'package:news_app/core/widgets/spacing_widget.dart';
class TopHeadlineItemWidget extends StatelessWidget {
  final String title;
  final String authorName;
  final String date;
  final String? imageUrl;

  const TopHeadlineItemWidget({
    super.key,
    required this.title,
    required this.authorName,
    required this.date,
    this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              imageUrl: imageUrl ??
                "https://media.istockphoto.com/id/488693126/"
                    "photo/election-results-daily-newspaper"
                    "-headline.jpg?s=612x612&w=0&k=20&c=Owu"
                    "BWOL8D-BnaDjx57ZcJFI7ls1uB-dALWXLJVUI1VU=",
              height: 206.h,
              fit: BoxFit.fitWidth,
            )
          ),
        ),
        const HeightSpace(height: 16),
        Text(
          title,
          style: AppTextStyles.subtitleStyle,
        ),
        const HeightSpace(height: 16),
        Text(
          "$authorName . $date",
          style: AppTextStyles.grey12w400Style,
        )
      ],
    );
  }
}
