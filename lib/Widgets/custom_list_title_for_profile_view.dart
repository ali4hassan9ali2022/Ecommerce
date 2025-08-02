import 'package:flutter/material.dart';

class CustomListTitleForProfileView extends StatelessWidget {
  const CustomListTitleForProfileView({
    super.key,
    required this.image,
    required this.title,
    this.icon,
  });
  final String image;
  final String title;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(image, height: 30),
      title: Text(title, style: TextStyle(fontSize: 16)),
      trailing: Icon(icon),
    );
  }
}
