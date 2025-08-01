import 'package:e_commerce/Cubit/app_cubit/app_cubit.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key, required this.appCubit});

  final AppCubit appCubit;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: appCubit.navigationDestinations,
      onDestinationSelected: (value) {
        appCubit.chanageBottomNavBar(index: value);
      },
      selectedIndex: appCubit.currentIndex,
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
