import 'dart:developer';

import 'package:e_commerce/Core/Database/Network/supabase_helper.dart';
import 'package:e_commerce/Core/Utils/assets.dart';
import 'package:e_commerce/Models/category_model.dart';
import 'package:e_commerce/Models/products_models.dart';
import 'package:e_commerce/Models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AppHelper {
  static ProductsModels? productsModels;
  static UserModel? userModel;
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
 
  static Future<String> uploadImageToStorage({
    required XFile? profilePic,
    required SupabaseClient? supabase,
    required String imageLinkOne,
    required String imageLinkTwo,
    required String uuid,
  }) async {
    final currentUser = Supabase.instance.client.auth.currentUser;
    if (currentUser == null) {
      throw Exception("حدث خطأ أثناء التسجيل، لم يتم المصادقة على المستخدم.");
    }

    // ✨ 2. إعداد الصورة الافتراضية أو رفع صورة المستخدم

    String imageUrl = "Assets/Images/737064202.png";

    if (profilePic != null) {
      try {
        final bytes = await profilePic.readAsBytes();
        final fileName = "$uuid${DateTime.now().millisecondsSinceEpoch}.jpg";
        final filePath = "public/$fileName";

        final storageResponse = await supabase!.storage
            .from(imageLinkOne)
            .uploadBinary(filePath, bytes);

        if (storageResponse.isNotEmpty) {
          final publicUrl = supabase.storage
              .from(imageLinkTwo)
              .getPublicUrl(filePath);

          imageUrl = publicUrl;
          log("✅ Image URL: $imageUrl");
        } else {
          log("❌ Image upload failed: empty response");
        }
      } catch (e) {
        log("❌ Image upload failed: $e");
      }
    }
    return imageUrl;
  }
  static int getTotalQuantity(List<Map<String, dynamic>> cartItems) {
    int totalQuantity = 0;
    for (var item in cartItems) {
      final quantityValue = item['quantity'];

      if (quantityValue is int) {
        totalQuantity += quantityValue;
      } else if (quantityValue is num) {
        totalQuantity += quantityValue.toInt();
      } else if (quantityValue is String) {
        totalQuantity += int.tryParse(quantityValue) ?? 0;
      }
    }
    return totalQuantity;
  }

  static double getTotalPrice(List<Map<String, dynamic>> cartItems) {
    double totalPrice = 0;
    for (var item in cartItems) {
      final product = item['products'];

      final productPrice =
          double.tryParse(product['productPrice'].toString()) ?? 0.0;
      final quantity = int.tryParse(item['quantity'].toString()) ?? 0;

      totalPrice += productPrice * quantity;
    }
    return totalPrice;
  }

  static void signOut(BuildContext context) async {
    await SupabaseHelper.supabase.auth.signOut();
    // GoRouter.of(context).pushReplacement(AppRouter.kSignInView);
  }
}



 // static Future<String> uploadImageToStorage({
  //   required XFile? profilePic,
  //   required SupabaseClient? supabase,
  //   required String imageLinkOne,
  //   required String imageLinkTwo,
  //   required String uuid,
  // }) async {
  //   final currentUser = Supabase.instance.client.auth.currentUser;
  //   if (currentUser == null) {
  //     throw Exception("حدث خطأ أثناء التسجيل، لم يتم المصادقة على المستخدم.");
  //   }
  //   String imageUrl = "Assets/Images/737064202.png";

  //   if (profilePic != null) {
  //     try {
  //       final bytes = await profilePic.readAsBytes();
  //       final fileName = "$uuid${DateTime.now().millisecondsSinceEpoch}.jpg";
  //       final filePath = "public/$fileName";

  //       final storageResponse = await supabase!.storage
  //           .from(imageLinkOne)
  //           .uploadBinary(filePath, bytes);

  //       if (storageResponse.isNotEmpty) {
  //         final publicUrl = supabase.storage
  //             .from(imageLinkTwo)
  //             .getPublicUrl(filePath);

  //         imageUrl = publicUrl;
  //         log("✅ Image URL: $imageUrl");
  //       } else {
  //         log("❌ Image upload failed: empty response");
  //       }
  //     } catch (e) {
  //       log("❌ Image upload failed: $e");
  //     }
  //   }
  //   return imageUrl;
  // }