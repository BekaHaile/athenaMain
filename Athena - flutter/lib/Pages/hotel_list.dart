import 'package:athena_2/Models/item.dart';
import 'package:flutter/material.dart';

class HotelList extends StatelessWidget {
  final data;
  HotelList(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: data["type"] == "restaurant"
            ? Text("Recommended area restaurants")
            : Text("Frequently requested locations"),
        elevation: 2,
        backgroundColor: Color.fromRGBO(0, 165, 81, 1),
      ),
      body: Lists(data),
    );
  }
}

class Lists extends StatelessWidget {
  final data;
  Lists(this.data);

  final List<Item> _data = [
    Item(
        title: 'Bavel',
        catagory: "Restaurant",
        place: "LA",
        ratings: "5.0/80",
        image:
            "https://upload.wikimedia.org/wikipedia/commons/6/62/Barbieri_-_ViaSophia25668.jpg",
        distance: "5",
        location:
            "https://www.google.com/maps/place/Bavel/@34.0414865,-118.2351159,17z/data=!3m1!4b1!4m5!3m4!1s0x80c2c63ce6f00001:0x408b2a5b25d4727!8m2!3d34.0414865!4d-118.2329272"),
    Item(
        title: 'LUCY LOUNGE & RESTAURANT',
        catagory: "Restaurant",
        place: "LA",
        ratings: "4.5/90",
        image: "https://www.ahstatic.com/photos/b3g8_rsr001_00_p_1024x768.jpg",
        distance: "6",
        location:
            "https://www.google.com/maps/place/Lucy+Lounge+%26+Restaurant/@9.038975,38.7600942,17z/data=!3m1!4b1!4m5!3m4!1s0x164b8f6152801827:0x8a2d42ea77f4c599!8m2!3d9.038975!4d38.7622829"),
    Item(
        title: 'LA Middle Eastern Restaurant',
        catagory: "Restaurant",
        place: "LA",
        ratings: "4.5/90",
        distance: "3.2",
        location:
            "https://www.google.com/maps/place/La+Mediterranee/@18.740082,-80.1215774,3z/data=!3m1!5s0x808f7e1cede7e4b5:0xcb628527186b1f5e!4m8!1m2!2m1!1sLA+Middle+Eastern!3m4!1s0x0:0x8bd6a8a6c9435432!8m2!3d37.7620299!4d-122.4316406",
        image:
            "https://cdn.vox-cdn.com/thumbor/hgD54g73-szNhswf_5B425Kp8Yg=/0x0:2000x1342/1200x800/filters:focal(840x511:1160x831)/cdn.vox-cdn.com/uploads/chorus_image/image/62739771/JakobLayman.0418.Bavel_015.0.jpg"),
    Item(
        title: 'ANTICA BAR AND RESTAURANT',
        catagory: "Restaurant",
        place: "LA",
        ratings: "4.5/90",
        distance: "2.5",
        location:
            "https://www.google.com/maps/place/Antica+Bar+%26+Restaurant/@8.9964266,38.7771296,17z/data=!3m1!4b1!4m5!3m4!1s0x164b84ffe27de0fd:0xb107ca4ff7474c6c!8m2!3d8.9964266!4d38.7793183",
        image:
            "https://media-cdn.tripadvisor.com/media/photo-s/02/3e/d9/2d/filename-dsc08785-jpg.jpg"),
    Item(
        title: 'Rara Restaurant',
        catagory: "Restaurant",
        place: "LA",
        ratings: "4.5/90",
        distance: "4",
        location:
            "https://www.google.com/maps/place/Rara+21100,+Nepal/@29.5421742,81.9880032,12z/data=!3m1!4b1!4m8!1m2!2m1!1sRara!3m4!1s0x39a337e64464502d:0x9a556781c43b8438!8m2!3d29.5286426!4d82.0625052",
        image:
            "https://ichef.bbci.co.uk/news/1024/cpsprodpb/102D8/production/_112546266_mediaitem112546106.jpg"),
  ];

  final List<Item> _data2 = [
    Item(
        title: 'Gardens By the Bay',
        catagory: "Gardens",
        place: "LA",
        ratings: "5.0/80",
        distance: "20",
        location:
            "https://www.google.com/maps/place/Gardens+by+the+Bay/@1.2815683,103.8614245,17z/data=!3m1!4b1!4m5!3m4!1s0x31da1904937e1633:0x62099677b59fca76!8m2!3d1.2815683!4d103.8636132",
        image:
            "https://www.worldatlas.com/r/w1200/upload/5c/36/ae/shutterstock-1014644104.jpg"),
    Item(
        title: 'Planet ware',
        catagory: "Parks",
        place: "LA",
        ratings: "4.5/90",
        distance: "2",
        image:
            "https://www.planetware.com/wpimages/2020/03/world-most-visited-cities-bangkok-thailand.jpg",
        location:
            "https://www.google.com/maps/place/PlanetWare/@-37.8169849,109.1526021,3z/data=!4m12!1m6!2m5!1splanet+ware!5m3!5m2!4m1!1i2!3m4!1s0x6ad6425122e0f257:0x65a113b78bded5f6!8m2!3d-37.8169849!4d145.0119771"),
    Item(
        title: 'National Orchid Garden',
        catagory: "Parks",
        place: "LA",
        ratings: "4.5/90",
        distance: "8",
        image:
            "https://pix10.agoda.net/hotelImages/4139035/0/05ca7d8f75d108aea5a80f2eab31a682.jpg?s=1024x768",
        location:
            "https://www.google.com/maps/place/National+Parks+Board/@1.3157058,103.8139938,17z/data=!3m1!4b1!4m5!3m4!1s0x31da1a1c9c88ea73:0x7728e7e0a02aa7!8m2!3d1.3157058!4d103.8161825"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(240, 245, 248, 1),
        Color.fromRGBO(221, 231, 233, 1),
        Color.fromRGBO(202, 213, 217, 1),
      ])),
      child: ListView.builder(
        padding: EdgeInsets.all(6),
        itemCount: data["type"] == "restaurant" ? _data.length : _data2.length,
        itemBuilder: (BuildContext context, int index) {
          Item item =
              data["type"] == "restaurant" ? _data[index] : _data2[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/hotelDetail", arguments: {
                "image": item.image,
                "name": item.title,
                "distance": item.distance,
                "location": item.location
              });
            },
            child: Card(
              elevation: 3,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 125,
                    width: 110,
                    padding: EdgeInsets.only(
                        left: 0, top: 10, bottom: 70, right: 20),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(item.image),
                            fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            item.title,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 165, 81, 1),
                                fontWeight: FontWeight.w700,
                                fontSize: 17),
                          ),
                        ),
                        Text(
                          item.catagory,
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                        Text(
                          item.place,
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Color.fromRGBO(213, 204, 41, 1),
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Color.fromRGBO(213, 204, 41, 1),
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Color.fromRGBO(213, 204, 41, 1),
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Color.fromRGBO(213, 204, 41, 1),
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Color.fromRGBO(213, 204, 41, 1),
                              size: 18,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              item.ratings,
                              style: TextStyle(fontSize: 13),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Ratings",
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
