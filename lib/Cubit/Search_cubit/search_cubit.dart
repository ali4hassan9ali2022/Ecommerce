import 'package:e_commerce/Cubit/Search_cubit/search_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(): super(SearchInitial());
  TextEditingController searchController = TextEditingController();
}