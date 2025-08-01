import 'package:e_commerce/Cubit/app_cubit/app_cubit.dart';
import 'package:e_commerce/Widgets/main_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: Scaffold(body: MainViewBody()),
    );
  }
}
