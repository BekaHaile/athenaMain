import 'package:flutter/material.dart';

class Folio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Folio of your stay"),
        backgroundColor: Color.fromRGBO(0, 165, 81, 1),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(240, 245, 248, 1),
          Color.fromRGBO(221, 231, 233, 1),
          Color.fromRGBO(202, 213, 217, 1),
        ])),
        child: Image.network(
            "https://i.pinimg.com/originals/80/4a/f5/804af573e62f82bd5a90a97b187e0671.jpg"),
      ),
    );
  }
}
