import "package:flutter/cupertino.dart";
import "package:go_router/go_router.dart";
import "package:news_app/features/home_screen/article_details_screen.dart";
import "package:news_app/features/home_screen/home_screen.dart";
import "package:news_app/features/home_screen/models/articles_model.dart";
import "package:news_app/features/search_result_screen/search_result_screen.dart";
import "app_routes.dart";

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.homeScreen,
      routes: [
        GoRoute(
          path: AppRoutes.homeScreen,
          name: AppRoutes.homeScreen,
          builder: (context, state) => const HomeScreen()
        ),
        GoRoute(
          path: AppRoutes.searchResultScreen,
          name: AppRoutes.searchResultScreen,
          builder: (context, state) {
            String query = state.extra as String;
            return SearchResultScreen(query: query);
          }
        ),
        GoRoute(
          path: AppRoutes.searchScreen,
          name: AppRoutes.searchScreen,
          builder: (context, state) => Container()
        ),
        GoRoute(
          path: AppRoutes.articleDetailsScreen,
          name: AppRoutes.articleDetailsScreen,
          builder: (context, state) {
            Article article = state.extra as Article;
            return ArticleDetailsScreen(
              article: article,
            );
          }
        ),
      ]
  );
}