import 'package:e_commerce/Core/Database/Local/supabase_helper.dart';
import 'package:e_commerce/Core/Helper/cache_helper.dart';
import 'package:e_commerce/Core/Theme/theme_mode.dart';
import 'package:e_commerce/Core/Utils/app_router.dart';
import 'package:e_commerce/Core/theme_cubit/theme_cubit.dart';
import 'package:e_commerce/Core/theme_cubit/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  await SupabaseHelper.initSupabase();

  runApp(const EcommerceAp());
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
