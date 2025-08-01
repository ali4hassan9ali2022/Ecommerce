import 'package:e_commerce/Core/Utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CustomListTitleForProfileView extends StatelessWidget {
  const CustomListTitleForProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.imagesAddress, height: 30),
      title: Text("Address", style: TextStyle(fontSize: 16)),
      trailing: Icon(IconlyBold.edit),
    );
  }
}