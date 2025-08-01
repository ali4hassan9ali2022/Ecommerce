import 'package:e_commerce/Core/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var themeMode = BlocProvider.of<ThemeCubit>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Ali Kasrawy",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          SwitchListTile(
            title: Text(themeMode.isDark ? "Dark Mode" : "Light Mode"),
            value: themeMode.isDark,
            onChanged: (value) {
              themeMode.setTheme(isValue: value);
            },
          ),
        ],
      ),
    );
  }
}
