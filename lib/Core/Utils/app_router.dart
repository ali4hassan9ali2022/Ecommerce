import 'package:e_commerce/Layout/main_view.dart';
import 'package:e_commerce/Views/Auth/log_in_view.dart';
import 'package:e_commerce/Views/Auth/sign_up_view.dart';
import 'package:e_commerce/Views/Wishliat_view.dart';
import 'package:e_commerce/Views/forgot_password_view.dart';
import 'package:e_commerce/Views/orders_view.dart';
import 'package:e_commerce/Views/products_details_view.dart';
import 'package:e_commerce/Views/viewed_recently_view.dart';
import 'package:go_router/go_router.dart';

// ... (imports remain the same)
import 'package:e_commerce/Core/Database/Local/supabase_helper.dart';

abstract class AppRouter {
  static const kSignUpView = "/SignUpView";
  static const kSignInView = "/SignInView";
  static const kMainView = "/MainView";
  static const kProductsDetails = "/kProductsDetails";
  static const kViewdRecentlyView = "/kViewdRecentlyView";
  static const kWishliatView = "/kWishliatView";
  static const kOrdersView = "/kOrdersView";
  static const kForgotViewView = "/kForgotViewView";

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => LogInView()),
      GoRoute(path: kSignUpView, builder: (context, state) => SignUpView()),
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
      GoRoute(path: kOrdersView, builder: (context, state) => OrdersView()),
      GoRoute(
        path: kForgotViewView,
        builder: (context, state) => ForgotPasswordView(),
      ),
    ],
    redirect: (context, state) {
      final user = SupabaseHelper.supabase.auth.currentUser;
      final bool isLoggedIn = user != null;
      final bool isLoggingIn = state.uri.toString() == '/';
      if (isLoggedIn) {
        if (isLoggingIn) {
          return kMainView;
        }
        return null;
      }
      else {
        if (!isLoggingIn && state.uri.toString() != kSignUpView) {
          return '/';
        }
        return null;
      }
    },
  );
}
