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
      ),
      body: Lists(data),
    );
  }
}

class Item {
  final String title;
  final String catagory;
  final String place;
  final String ratings;
  final String image;
  final String distance;

  Item(
      {this.title,
      this.catagory,
      this.place,
      this.ratings,
      this.image,
      this.distance});
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
    ),
    Item(
        title: 'LUCY LOUNGE & RESTAURANT',
        catagory: "Restaurant",
        place: "LA",
        ratings: "4.5/90",
        image: "https://www.ahstatic.com/photos/b3g8_rsr001_00_p_1024x768.jpg",
        distance: "6"),
    Item(
        title: 'LA Middle Eastern Restaurant',
        catagory: "Restaurant",
        place: "LA",
        ratings: "4.5/90",
        distance: "3.2",
        image:
            "https://cdn.vox-cdn.com/thumbor/hgD54g73-szNhswf_5B425Kp8Yg=/0x0:2000x1342/1200x800/filters:focal(840x511:1160x831)/cdn.vox-cdn.com/uploads/chorus_image/image/62739771/JakobLayman.0418.Bavel_015.0.jpg"),
    Item(
        title: 'ANTICA BAR AND RESTAURANT',
        catagory: "Restaurant",
        place: "LA",
        ratings: "4.5/90",
        distance: "2.5",
        image:
            "https://media-cdn.tripadvisor.com/media/photo-s/02/3e/d9/2d/filename-dsc08785-jpg.jpg"),
    Item(
        title: 'Rara Restaurant',
        catagory: "Restaurant",
        place: "LA",
        ratings: "4.5/90",
        distance: "4",
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
        image:
            "https://www.worldatlas.com/r/w1200/upload/5c/36/ae/shutterstock-1014644104.jpg"),
    Item(
        title: 'Planet ware',
        catagory: "Parks",
        place: "LA",
        ratings: "4.5/90",
        distance: "2",
        image:
            "https://www.planetware.com/wpimages/2020/03/world-most-visited-cities-bangkok-thailand.jpg"),
    Item(
        title: 'National Orchid Garden',
        catagory: "Parks",
        place: "LA",
        ratings: "4.5/90",
        distance: "8",
        image:
            "https://pix10.agoda.net/hotelImages/4139035/0/05ca7d8f75d108aea5a80f2eab31a682.jpg?s=1024x768"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(6),
      itemCount: data["type"] == "restaurant" ? _data.length : _data2.length,
      itemBuilder: (BuildContext context, int index) {
        Item item = data["type"] == "restaurant" ? _data[index] : _data2[index];
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/hotelDetail", arguments: {
              "image": item.image,
              "name": item.title,
              "distance": item.distance
            });
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
