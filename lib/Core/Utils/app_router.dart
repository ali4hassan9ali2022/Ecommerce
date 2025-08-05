import 'package:e_commerce/Layout/main_view.dart';
import 'package:e_commerce/Views/Auth/log_in_view.dart';
import 'package:e_commerce/Views/Wishliat_view.dart';
import 'package:e_commerce/Views/products_details_view.dart';
import 'package:e_commerce/Views/viewed_recently_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kSignUpView = "/SignUpView";
  static const kSignInView = "/SignInView";
  static const kMainView = "/MainView";
  static const kProductsDetails = "/kProductsDetails";
  static const kViewdRecentlyView = "/kViewdRecentlyView";
  static const kWishliatView = "/kWishliatView";
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => LogInView()),
      GoRoute(path: kMainView, builder: (context, state) => MainView()),
      GoRoute(
        path: kProductsDetails,
        builder: (context, state) => ProductsDetailsView(),
      ),
      GoRoute(
        path: kViewdRecentlyView,
        builder: (context, state) => ViewedRecentlyView(),
      ),
      GoRoute(path: kWishliatView, builder: (context, state) => WishliatView()),
    ],
  );
}
