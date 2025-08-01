import 'package:e_commerce/Core/Helper/cache_helper.dart';
import 'package:flutter/material.dart';

void main() {
  
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(const EcommerceAp());
}

class EcommerceAp extends StatelessWidget {
  const EcommerceAp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E-commerce App",
      home: Scaffold());
  }
}
