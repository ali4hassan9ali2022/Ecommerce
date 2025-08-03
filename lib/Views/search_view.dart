import 'package:e_commerce/Widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          SizedBox(height: 10),
          CustomTextFormField(
            prefixIcon: Icons.search,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.clear, color: Colors.red),
            ),
            hintText: "Search for products",
            onChanged: (value) {
              
            },
            onSaved: (value) {
              
            },
          ),
        ],
      ),
    );
  }
}
