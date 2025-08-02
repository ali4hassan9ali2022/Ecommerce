import 'package:e_commerce/Cubit/app_cubit/app_state.dart';
import 'package:e_commerce/Views/cart_view.dart';
import 'package:e_commerce/Views/home_view.dart';
import 'package:e_commerce/Views/profile_view.dart';
import 'package:e_commerce/Views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppStateInitial());
  int currentIndex = 0;
  late PageController pageController = PageController(
    initialPage: currentIndex,
  );
  List<Widget> screens = [HomeView(), SearchView(), CartView(), ProfileView()];
  List<NavigationDestination> navigationDestinations = [
    NavigationDestination(icon: Icon(IconlyLight.home), label: "Home"),
    NavigationDestination(icon: Icon(IconlyLight.search), label: "Search"),
    NavigationDestination(icon: Icon(IconlyLight.bag2), label: "Cart"),
    NavigationDestination(icon: Icon(IconlyLight.profile), label: "Profile"),
  ];
  chanagePageView({required int index}) {
    currentIndex = index;
    // pageController.nextPage(
    //   duration: Duration(milliseconds: 250),
    //   curve: Curves.easeInOut,
    // );
    emit(ChanagePageView());
  }

  chanageBottomNavBar({required int index}) {
    currentIndex = index;
    pageController.jumpToPage(index);
    emit(ChanageBottomNavBar());
  }
}


