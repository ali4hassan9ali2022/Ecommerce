import 'package:e_commerce/Core/Utils/assets.dart';
import 'package:e_commerce/Core/theme_cubit/theme_cubit.dart';
import 'package:e_commerce/Core/theme_cubit/theme_state.dart';
import 'package:e_commerce/Views/Wishliat_view.dart';
import 'package:e_commerce/Views/viewed_recently_view.dart';
import 'package:e_commerce/Widgets/custom_list_title_for_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
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
                CustomListTitleForProfileView(
                  title: "All Orders",
                  icon: IconlyBold.edit,
                  image: Assets.imagesOrderSvg,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WishliatView()),
                    );
                  },
                  child: CustomListTitleForProfileView(
                    title: "WishList",
                    icon: IconlyBold.edit,
                    image: Assets.imagesWishlistSvg,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewedRecentlyView(),
                      ),
                    );
                  },
                  child: CustomListTitleForProfileView(
                    title: "Viewed recently",
                    icon: IconlyBold.edit,
                    image: Assets.imagesRecent,
                  ),
                ),
                CustomListTitleForProfileView(
                  title: "Address",
                  icon: IconlyBold.edit,
                  image: Assets.imagesAddress,
                ),
                Divider(thickness: 1),
                SizedBox(height: 7),
                Text(
                  "Settings",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) {
                    return SwitchListTile(
                      secondary: Image.asset(Assets.imagesTheme, height: 30),
                      title: Text(
                        BlocProvider.of<ThemeCubit>(context).isDark
                            ? "Dark Mode"
                            : "Light Mode",
                      ),
                      value: BlocProvider.of<ThemeCubit>(context).isDark,
                      onChanged: (value) {
                        BlocProvider.of<ThemeCubit>(
                          context,
                        ).setTheme(isValue: value);
                      },
                    );
                  },
                ),
                Divider(thickness: 1),
                SizedBox(height: 7),
                Text(
                  "Others",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                CustomListTitleForProfileView(
                  title: "Privacy & Policy",

                  image: Assets.imagesPrivacy,
                ),

                // Expanded(child: SizedBox()),
              ],
            ),
          ),
          Center(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                iconColor: Colors.white,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(30),
                ),
              ),
              onPressed: () {},
              label: Text("Logout"),
              icon: Icon(Icons.logout),
            ),
          ),
        ],
      ),
    );
  }
}
