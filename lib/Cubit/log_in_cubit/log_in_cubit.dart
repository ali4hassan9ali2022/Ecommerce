import 'package:e_commerce/Cubit/log_in_cubit/log_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitialState());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
} 