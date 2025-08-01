import 'package:e_commerce/Core/Utils/assets.dart';
import 'package:e_commerce/Widgets/custom_list_title_for_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("Please login to have ultimate access"),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).cardColor,
                  border: Border.all(width: 2, color: Colors.lightBlue),
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: 7),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ali Kasrawy",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "aliKasrawy7@gmail.com",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "General",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              CustomListTitleForProfileView(),
            ],
          ),
        ),
      ],
    );
  }
}


