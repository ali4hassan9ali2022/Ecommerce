import 'package:e_commerce/Core/Utils/assets.dart';
import 'package:e_commerce/Cubit/Search_cubit/search_cubit.dart';
import 'package:e_commerce/Cubit/app_cubit/app_cubit.dart';
import 'package:e_commerce/Cubit/app_cubit/app_state.dart';
import 'package:e_commerce/Cubit/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/Cubit/home_cubit/home_cubit.dart';
import 'package:e_commerce/Cubit/profile_cubit/profile_cubit.dart';
import 'package:e_commerce/Widgets/app_shimmer%20.dart';
import 'package:e_commerce/Widgets/custom_navigation_bar.dart';
import 'package:e_commerce/Widgets/main_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(create: (context) => AppCubit()),
        BlocProvider<SearchCubit>(create: (context) => SearchCubit()),
        BlocProvider<ProfileCubit>(create: (context) => ProfileCubit()),
        BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
        BlocProvider<CartCubit>(create: (context) => CartCubit()),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var appCubit = BlocProvider.of<AppCubit>(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                appCubit.currentIndex == 2
                    ? IconButton.filled(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                        ),
                        onPressed: () {},
                        color: Colors.white,
                        icon: Icon(Icons.delete_forever_rounded),
                      )
                    : SizedBox(),
              ],
              title: ShimmerText(text: appCubit.title[appCubit.currentIndex]),
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
