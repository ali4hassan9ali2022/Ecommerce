import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:e_commerce/Core/Helper/app_helper.dart';
import 'package:e_commerce/Core/Utils/app_router.dart';
import 'package:e_commerce/Core/Utils/strings.dart';
import 'package:e_commerce/Cubit/home_cubit/home_cubit.dart';
import 'package:e_commerce/Cubit/home_cubit/home_state.dart';
import 'package:e_commerce/Widgets/category_rounded.dart';
import 'package:e_commerce/Widgets/custom_swiper_to_home_view.dart';
import 'package:e_commerce/Widgets/latest_arrivals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    BlocProvider.of<HomeCubit>(context).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSwiperToHomeView(size: size),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  Strings.latestArrivals,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                height: size.height * 0.2,

                child: state is SuccessHomeState
                    ? ListView.builder(
                        itemCount: state.products.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () async {
                              await GoRouter.of(
                                context,
                              ).push(AppRouter.kProductsDetails);
                            },
                            child: LatestArrivals(
                              productsModels: state.products[index],
                            ),
                          );
                        },
                      )
                    : state is LoadingHomeState
                    ? Center(child: CircularProgressIndicator())
                    : Center(child: Text("Not Products found")),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  Strings.categories,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30),
              DynamicHeightGridView(
                builder: (context, index) =>
                    CategoryRounded(categoryModel: AppHelper.categories[index]),
                itemCount: AppHelper.categories.length,
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        );
      },
    );
  }
}
