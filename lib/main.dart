import 'package:e_commerce/Core/Database/Network/supabase_helper.dart';
import 'package:e_commerce/Core/Helper/cache_helper.dart';
import 'package:e_commerce/Core/Theme/theme_mode.dart';
import 'package:e_commerce/Core/Utils/app_router.dart';
import 'package:e_commerce/Core/theme_cubit/theme_cubit.dart';
import 'package:e_commerce/Core/theme_cubit/theme_state.dart';
import 'package:e_commerce/Cubit/Search_cubit/search_cubit.dart';
import 'package:e_commerce/Cubit/app_cubit/app_cubit.dart';
import 'package:e_commerce/Cubit/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/Cubit/favorite_cubit/favorite_cubit.dart';
import 'package:e_commerce/Cubit/home_cubit/home_cubit.dart';
import 'package:e_commerce/Cubit/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  await SupabaseHelper.initSupabase();

  runApp(MultiBlocProvider(
    providers: [
       BlocProvider<AppCubit>(create: (context) => AppCubit()),
        BlocProvider<SearchCubit>(create: (context) => SearchCubit()),
        BlocProvider<ProfileCubit>(create: (context) => ProfileCubit()),
        BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
        BlocProvider<CartCubit>(create: (context) => CartCubit()),
        BlocProvider<FavoriteCubit>(
          create: (context) => FavoriteCubit()..loadFavorites(),
        ),
    ],
    child: const EcommerceAp()));
}

class EcommerceAp extends StatelessWidget {
  const EcommerceAp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocConsumer<ThemeCubit, ThemeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: lightMode(context),
            darkTheme: darkTheme(context),
            themeMode: BlocProvider.of<ThemeCubit>(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            title: "E-commerce App",
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
