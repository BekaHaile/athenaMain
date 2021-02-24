import 'package:flutter/material.dart';

class HotelList extends StatelessWidget {
  static final String path = "lib/src/pages/lists/list1.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hotel list in your area"),
        elevation: 2,
      ),
      body: Lists(),
    );
  }
}

class Item {
  final String title;
  final String catagory;
  final String place;
  final String ratings;
  final String image;

  Item({this.title, this.catagory, this.place, this.ratings, this.image});
}

class Lists extends StatelessWidget {
  final List<Item> _data = [
    Item(
        title: 'Gardens By the Bay',
        catagory: "Gardens",
        place: "Singapore",
        ratings: "5.0/80",
        image:
            "https://media.cntraveler.com/photos/5c06e5a701ffc86b13da2528/master/w_2540,h_1694,c_limit/The-Oberoi-Udaivilas,-Udaipur__2018_Premier-Lake-View-Rooms-with-Semi-Private-Pools---The-Oberoi-Udaivilas,-Udaipur-01.jpg"),
    Item(
        title: 'Singapore Zoo',
        catagory: "Parks",
        place: "Singapore",
        ratings: "4.5/90",
        image:
            "https://i2.wp.com/theluxurytravelexpert.com/wp-content/uploads/2020/02/HEADER-e1581690281650.jpg?fit=1200%2C675&ssl=1"),
    Item(
        title: 'National Orchid Garden',
        catagory: "Parks",
        place: "Singapore",
        ratings: "4.5/90",
        image:
            "https://www.orangesmile.com/ru/foto/futuristic-hotels/apeironhotel.jpg"),
    Item(
        title: 'Godabari',
        catagory: "Parks",
        place: "Singapore",
        ratings: "4.5/90",
        image:
            "https://images.pexels.com/photos/189296/pexels-photo-189296.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
    Item(
        title: 'Rara',
        catagory: "Parks",
        place: "Singapore",
        ratings: "4.5/90",
        image:
            "https://www.luxurylifestylemag.co.uk/wp-content/uploads/2018/06/emirates-palace-abu-dhabi-terrace-view2.jpgwidth1905height794modecropanchortopcenterautorotatetruequality90scalebothprogressivetrueencoderfreeimage.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(6),
      itemCount: _data.length,
      itemBuilder: (BuildContext context, int index) {
        Item item = _data[index];
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/hotelDetail",
                arguments: {"image": item.image, "name": item.title});
          },
          child: Card(
            elevation: 3,
            child: Row(
              children: <Widget>[
                Container(
                  height: 125,
                  width: 110,
                  padding:
                      EdgeInsets.only(left: 0, top: 10, bottom: 70, right: 20),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(item.image), fit: BoxFit.cover)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item.title,
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.w700,
                            fontSize: 17),
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
                            color: Colors.pink,
                            size: 18,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 18,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 18,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 18,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.pink,
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
    );
  }
}
