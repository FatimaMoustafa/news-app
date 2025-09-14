import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/widgets/custom_text_field.dart';
class SearchTextFieldWidget extends StatefulWidget {
  const SearchTextFieldWidget({super.key});

  @override
  State<SearchTextFieldWidget> createState() => _SearchTextFieldWidgetState();
}

class _SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  bool showTextFormField = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        showTextFormField ?
        CustomTextField(
          width: 175.w,
          hintText: "search".tr(),
          onFieldSubmitted: (value){
            GoRouter.of(context).pushNamed(
              AppRoutes.searchResultScreen,
              extra: value,
            );
          },
        )
        : SizedBox.shrink(),
        IconButton(
          onPressed: () {
            setState(() {
              showTextFormField = !showTextFormField;
            });
          },
          icon: Icon(Icons.search, size: 24.sp),
        ),
      ],
    );
  }
}
