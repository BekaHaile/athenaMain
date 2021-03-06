import 'package:athena_2/Pages/athena_home.dart';
import 'package:athena_2/Pages/chat_detail_page.dart';
import 'package:athena_2/Pages/folio.dart';
import 'package:athena_2/Pages/hotel_detail.dart';
import 'package:athena_2/Pages/hotel_list.dart';
import 'package:flutter/material.dart';
// import 'package:highlight_text/highlight_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Voice',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AthenaHome(),
        routes: {
          '/chatDetail': (BuildContext context) => ChatDetailPage(),
          '/folio': (BuildContext context) => Folio(),
        },
        onGenerateRoute: (RouteSettings settings) {
          final requests = settings.arguments;

          switch (settings.name) {
            case '/hotelDetail':
              return MaterialPageRoute(
                  builder: (_) => HotelDetailsPage(
                        requests,
                      ));
            case '/hotelList':
              return MaterialPageRoute(
                  builder: (_) => HotelList(
                        requests,
                      ));
            default:
              return null;
          }
        });
  }
}
