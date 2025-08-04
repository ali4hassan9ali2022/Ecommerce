import 'package:e_commerce/Core/Utils/assets.dart';
import 'package:e_commerce/Models/category_model.dart';

abstract class AppHelper {
  static const String kDark = "isDark";
  static bool isDark = false;
  static List<String> images = [Assets.imagesBanner1, Assets.imagesBanner2];
  static List<CategoryModel> categories = [
    CategoryModel(id: "1", image: Assets.imagesMobiles, title: "Phones"),
    CategoryModel(
      id: "2",
      image: Assets.imagesElectronics,
      title: "Electronics",
    ),
    CategoryModel(id: "3", image: Assets.imagesCosmetics, title: "Cosmetics"),
    CategoryModel(id: "4", image: Assets.imagesShoes, title: "Shoses"),
    CategoryModel(id: "5", image: Assets.imagesWatch, title: "Watches"),
    CategoryModel(id: "6", image: Assets.imagesPc, title: "Laptops"),
    CategoryModel(id: "7", image: Assets.imagesBookImg, title: "Books"),
    CategoryModel(id: "8", image: Assets.imagesFashion, title: "Clothes"),
  ];
}
