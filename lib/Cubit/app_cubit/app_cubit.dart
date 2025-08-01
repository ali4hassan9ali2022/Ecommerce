import 'package:e_commerce/Cubit/app_cubit/app_state.dart';
import 'package:e_commerce/Views/cart_view.dart';
import 'package:e_commerce/Views/profile_view.dart';
import 'package:e_commerce/Views/search_view.dart';
import 'package:e_commerce/home_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppStateInitial());
  int currentIndex = 0;
  late PageController pageController = PageController(
    initialPage: currentIndex,
  );
  List<Widget> screens = [HomeView(), SearchView(), CartView(), ProfileView()];
  chanagePageView({required int index}) {
    currentIndex = index;
    // pageController.nextPage(
    //   duration: Duration(milliseconds: 250),
    //   curve: Curves.easeInOut,
    // );
    emit(ChanagePageView());
  }
}
