import 'package:e_commerce/Core/Helper/app_helper.dart';
import 'package:e_commerce/Core/Helper/cache_helper.dart';
import 'package:e_commerce/Core/theme_cubit/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  bool isDark = false;

  Future<void> setTheme({required bool isValue}) async {
   await CacheHelper().saveData(key: AppHelper.kDark, value: isValue);
    isDark = isValue;
    emit(DarkTheme());
  }

  Future<bool> getTheme() async{
    isDark = await CacheHelper().getData(key: AppHelper.kDark) ?? false;
    emit(LightTheme());
    return isDark;
  } 
}