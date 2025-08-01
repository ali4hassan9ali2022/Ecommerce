import 'package:e_commerce/Cubit/app_cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var appCubit = BlocProvider.of<AppCubit>(context);
    return PageView.builder(
      controller: appCubit.pageController,
      onPageChanged: (value) {
        appCubit.chanagePageView(index: value);
      },
      itemBuilder: (context, index) => appCubit.screens[index],
      itemCount: appCubit.screens.length,
    );
  }
}
