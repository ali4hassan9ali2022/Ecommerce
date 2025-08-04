import 'package:e_commerce/Widgets/viewed_recently_view_body.dart';
import 'package:flutter/material.dart';

class ViewedRecentlyView extends StatelessWidget {
  const ViewedRecentlyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: ViewedRecentlyViewBody());
  }
}
