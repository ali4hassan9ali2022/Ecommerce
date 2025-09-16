import 'package:e_commerce/Core/Utils/assets.dart';
import 'package:e_commerce/Cubit/app_cubit/app_cubit.dart';
import 'package:e_commerce/Cubit/app_cubit/app_state.dart';
import 'package:e_commerce/Cubit/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/Cubit/cart_cubit/cart_state.dart';
import 'package:e_commerce/Widgets/app_shimmer%20.dart';
import 'package:e_commerce/Widgets/custom_navigation_bar.dart';
import 'package:e_commerce/Widgets/main_view_body.dart';
import 'package:e_commerce/Widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var appCubit = BlocProvider.of<AppCubit>(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              appCubit.currentIndex == 2
                  ? BlocConsumer<CartCubit, CartState>(
                      listener: (context, state) {
                        if (state is SuccessClearCartState) {
                          CustomToastWidget.showSuccessToast("Clear Done");
                        } else if (state is FailureClearCartState) {
                          CustomToastWidget.showErrorToast("Clear failed");
                        }
                      },
                      builder: (context, state) {
                        return IconButton.filled(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                          ),
                          onPressed: () {
                            BlocProvider.of<CartCubit>(context).clearCart();
                          },
                          color: Colors.white,
                          icon: Icon(Icons.delete_forever_rounded),
                        );
                      },
                    )
                  : SizedBox(),
            ],
            title: ShimmerText(text: appCubit.title[appCubit.currentIndex]),
            leading: Image.asset(Assets.imagesShoppingCart),
          ),
          body: MainViewBody(),
          bottomNavigationBar: CustomNavigationBar(appCubit: appCubit),
        );
      },
    );
  }
}
