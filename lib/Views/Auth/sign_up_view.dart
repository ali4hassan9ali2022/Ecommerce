import 'package:e_commerce/Cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:e_commerce/Widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(appBar: AppBar(), body: SignUpViewBody()),
    );
  }
}
