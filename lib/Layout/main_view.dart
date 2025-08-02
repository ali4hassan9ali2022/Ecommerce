import 'package:e_commerce/Core/Utils/assets.dart';
import 'package:e_commerce/Cubit/app_cubit/app_cubit.dart';
import 'package:e_commerce/Cubit/app_cubit/app_state.dart';
import 'package:e_commerce/Widgets/app_shimmer%20.dart';
import 'package:e_commerce/Widgets/custom_navigation_bar.dart';
import 'package:e_commerce/Widgets/main_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var appCubit = BlocProvider.of<AppCubit>(context);
          return Scaffold(
            appBar: AppBar(
              title: ShimmerText(),
              leading: Image.asset(Assets.imagesShoppingCart),
            ),
            body: MainViewBody(),
            bottomNavigationBar: CustomNavigationBar(appCubit: appCubit),
          );
        },
      ),
    );
  }
}
