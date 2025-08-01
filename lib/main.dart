import 'package:e_commerce/Core/Helper/cache_helper.dart';
import 'package:e_commerce/Core/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(const EcommerceAp());
}

class EcommerceAp extends StatelessWidget {
  const EcommerceAp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "E-commerce App",
        home: Scaffold(),
      ),
    );
  }
}
