import 'package:e_commerce/Core/Database/Local/supabase_helper.dart';
import 'package:e_commerce/Core/Utils/app_router.dart';
import 'package:e_commerce/Core/Utils/assets.dart';
import 'package:e_commerce/Core/Utils/strings.dart';
import 'package:e_commerce/Core/theme_cubit/theme_cubit.dart';
import 'package:e_commerce/Core/theme_cubit/theme_state.dart';
import 'package:e_commerce/Cubit/profile_cubit/profile_cubit.dart';
import 'package:e_commerce/Cubit/profile_cubit/profile_state.dart';
import 'package:e_commerce/Widgets/custom_alert_dialog.dart';
import 'package:e_commerce/Widgets/custom_list_title_for_profile_view.dart';
import 'package:e_commerce/Widgets/profile_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    BlocProvider.of<ProfileCubit>(context).fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    var user = SupabaseHelper.supabase.auth.currentUser;
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is SuccessProfileState) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: user == null ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(Strings.pleaseLoginToHaveUltimateAccess),
                  ),
                ),
                const SizedBox(height: 20),
                user == null
                    ? SizedBox.shrink()
                    : ProfileDetails(userModel: state.userModel),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.general,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      user == null
                          ? SizedBox.shrink()
                          : InkWell(
                              onTap: () async {
                                await GoRouter.of(
                                  context,
                                ).push(AppRouter.kOrdersView);
                              },
                              child: CustomListTitleForProfileView(
                                title: Strings.allOrders,
                                icon: IconlyBold.edit,
                                image: Assets.imagesOrderSvg,
                              ),
                            ),
                      user == null
                          ? SizedBox.shrink()
                          : InkWell(
                              onTap: () async {
                                await GoRouter.of(
                                  context,
                                ).push(AppRouter.kWishliatView);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => WishliatView()),
                                // );
                              },
                              child: CustomListTitleForProfileView(
                                title: Strings.wishList,
                                icon: IconlyBold.edit,
                                image: Assets.imagesWishlistSvg,
                              ),
                            ),
                      InkWell(
                        onTap: () async {
                          await GoRouter.of(
                            context,
                          ).push(AppRouter.kViewdRecentlyView);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => ViewedRecentlyView(),
                          //   ),
                          // );
                        },
                        child: CustomListTitleForProfileView(
                          title: Strings.viewedRecently,
                          icon: IconlyBold.edit,
                          image: Assets.imagesRecent,
                        ),
                      ),
                      CustomListTitleForProfileView(
                        title: Strings.address,
                        icon: IconlyBold.edit,
                        image: Assets.imagesAddress,
                      ),
                      Divider(thickness: 1),
                      SizedBox(height: 7),
                      Text(
                        Strings.settings,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      BlocBuilder<ThemeCubit, ThemeState>(
                        builder: (context, state) {
                          return SwitchListTile(
                            secondary: Image.asset(
                              Assets.imagesTheme,
                              height: 30,
                            ),
                            title: Text(
                              BlocProvider.of<ThemeCubit>(context).isDark
                                  ? Strings.darkMode
                                  : Strings.lightMode,
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
                        Strings.others,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      CustomListTitleForProfileView(
                        title: Strings.privacyPolicy,
                        image: Assets.imagesPrivacy,
                      ),

                      // Expanded(child: SizedBox()),
                    ],
                  ),
                ),
                user == null
                    ? Center(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            iconColor: Colors.white,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(30),
                            ),
                          ),
                          onPressed: () async {
                            GoRouter.of(
                              context,
                            ).pushReplacement("/");
                          },
                          label: Text(Strings.signIn),
                          icon: Icon(Icons.login),
                        ),
                      )
                    : Center(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            iconColor: Colors.white,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(30),
                            ),
                          ),
                          onPressed: () async {
                            await showDialog(
                              context: context,
                              builder: (context) {
                                return CustomAlertDialog();
                              },
                            );
                          },
                          label: Text(Strings.signOut),
                          icon: Icon(Icons.logout),
                        ),
                      ),
              ],
            ),
          );
        } else if (state is FailureProfileState) {
          return Center(child: Text(state.errMessage));
        } else {
          return Center(child: Text("Loading..."));
        }
      },
    );
  }
}
