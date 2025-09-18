import 'package:e_commerce/Cubit/favorite_cubit/favorite_cubit.dart';
import 'package:e_commerce/Cubit/favorite_cubit/favorite_state.dart';
import 'package:e_commerce/Widgets/wishlist_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishliatView extends StatefulWidget {
  const WishliatView({super.key});

  @override
  State<WishliatView> createState() => _WishliatViewState();
}

class _WishliatViewState extends State<WishliatView> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await BlocProvider.of<FavoriteCubit>(context).getCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) async {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: state is SuccessLoadFavoriteProductsState
                ? Text("WishList (${state.cartItems.length})")
                : Text("WishList (0)"),
            actions: [
              IconButton.filled(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                onPressed: () {},
                color: Colors.white,
                icon: Icon(Icons.delete_forever_rounded),
              ),
            ],
          ),
          body: WishlistViewBody(),
        );
      },
    );
  }
}
