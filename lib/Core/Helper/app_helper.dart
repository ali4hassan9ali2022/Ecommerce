import 'package:e_commerce/Core/Utils/assets.dart';

abstract class AppHelper {
  static const String kDark  = "isDark"; 
  static bool isDark = false;
  static List<String> images = [
    Assets.imagesBanner1,
    Assets.imagesBanner2,
  ];
}