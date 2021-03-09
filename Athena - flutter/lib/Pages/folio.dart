import 'package:flutter/material.dart';

class Folio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Folio of your stay"),
      ),
      body: Image.network(
          "https://i.pinimg.com/originals/80/4a/f5/804af573e62f82bd5a90a97b187e0671.jpg"),
    );
  }
}
