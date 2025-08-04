import 'dart:developer';

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:e_commerce/Cubit/Search_cubit/search_cubit.dart';
import 'package:e_commerce/Cubit/Search_cubit/search_state.dart';
import 'package:e_commerce/Views/products_details_view.dart';
import 'package:e_commerce/Widgets/custom_product_widget.dart';
import 'package:e_commerce/Widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    var searchCubit = BlocProvider.of<SearchCubit>(context);
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 10)),
              SliverToBoxAdapter(
                child: CustomTextFormField(
                  controller: searchCubit.searchController,
                  prefixIcon: Icons.search,
                  suffixIcon: IconButton(
                    onPressed: () {
                      searchCubit.searchController.clear();
                    },
                    icon: Icon(Icons.clear, color: Colors.red),
                  ),
                  hintText: "Search for products",
                  onChanged: (value) {
                    log(value.toString());
                  },
                  onSaved: (value) {
                    log(searchCubit.searchController.text);
                  },
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 15)),
              SliverFillRemaining(
                child: DynamicHeightGridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  builder: (context, index) => InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductsDetailsView(),
                        ),
                      );
                    },
                    child: CustomProductWidget(),
                  ),
                  itemCount: 100,
                  crossAxisCount: 2,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
