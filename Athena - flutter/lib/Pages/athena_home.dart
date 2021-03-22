import 'package:flutter/material.dart';

class AthenaHome extends StatefulWidget {
  @override
  _AthenaHomeState createState() => _AthenaHomeState();
}

class _AthenaHomeState extends State<AthenaHome> {
  bool initialized = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(240, 245, 248, 1),
        Color.fromRGBO(221, 231, 233, 1),
        Color.fromRGBO(202, 213, 217, 1),
      ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Image.asset(
                  'assets/athen.gif',
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      'Hello cherished Guest, I am Athena your virtual concierge',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
            child: Text(
              'You can use me by clicking the mic below',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          FloatingActionButton(
            backgroundColor: Color.fromRGBO(0, 165, 81, 1),
            onPressed: () {
              Navigator.pushNamed(context, '/chatDetail');
              // dynamic data = {"message": "Hi", "sender": "id344"};
              // API().postData(data);
              // API().getData();
            },
            child: Icon(
              Icons.mic,
            ),
          ),
        ],
      ),
    );
  }
}
