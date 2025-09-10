import 'dart:developer';

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:e_commerce/Core/Utils/app_router.dart';
import 'package:e_commerce/Core/Utils/strings.dart';
import 'package:e_commerce/Cubit/Search_cubit/search_cubit.dart';
import 'package:e_commerce/Cubit/Search_cubit/search_state.dart';
import 'package:e_commerce/Widgets/custom_product_widget.dart';
import 'package:e_commerce/Widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    BlocProvider.of<SearchCubit>(context).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    var searchCubit = BlocProvider.of<SearchCubit>(context);
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 10)),
              SliverToBoxAdapter(
                child: CustomTextFormField(
                  controller: searchCubit.searchController,
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: () {
                      searchCubit.searchController.clear();
                    },
                    icon: Icon(Icons.clear, color: Colors.red),
                  ),
                  hintText: Strings.search,
                  onChanged: (value) {
                    log(value.toString());
                  },
                  onSaved: (value) {
                    log(searchCubit.searchController.text);
                  },
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 15)),
              state is SuccessSearchState
                  ? SliverFillRemaining(
                      child: DynamicHeightGridView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        builder: (context, index) => InkWell(
                          onTap: () async {
                            await GoRouter.of(
                              context,
                            ).push(AppRouter.kProductsDetails);
                            // await Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => ProductsDetailsView(),
                            //   ),
                            // );
                          },
                          child: CustomProductWidget(
                            productsModels: state.products[index],
                          ),
                        ),
                        itemCount: state.products.length,
                        crossAxisCount: 2,
                      ),
                    )
                  : state is LoadingSearchState
                  ? SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : state is FailureSearchState
                  ? SliverFillRemaining(
                      child: Center(child: Text(state.errMessage)),
                    )
                  : SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
