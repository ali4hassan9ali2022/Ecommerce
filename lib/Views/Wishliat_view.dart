import 'package:flutter/material.dart';

class WishliatView extends StatelessWidget {
  const WishliatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WishList (1)"),
        actions: [
          IconButton.filled(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
            onPressed: () {},
            color: Colors.white,
            icon: Icon(Icons.delete_forever_rounded),
          ),
        ],
      ),
    );
  }
}
