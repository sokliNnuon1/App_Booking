import 'package:flutter/material.dart';
import 'button_navigate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 5), // changes position of shadow
        ),
      ],
    );
  }

  // List of items to be displayed in the ListView
  final List<Map<String, dynamic>> items = [
    {'icon': Icons.hotel, 'text': 'Hotel'},
    {'icon': Icons.restaurant, 'text': 'Restaurant'},
    {'icon': Icons.bus_alert_rounded, 'text': 'Bus'},
    {'icon': Icons.train, 'text': 'Train'},
    {'icon': Icons.house, 'text': 'House'},
    // Add more items here
  ];

  // List of favorite items
  final List<Map<String, dynamic>> favorites = [
    {'image': 'assets/book3.jpg', 'name': 'Place Name 1', 'price': '400'},
    {'image': 'assets/book2.jpg', 'name': 'Place Name 2', 'price': '450'},
    {'image': 'assets/book1.jpg', 'name': 'Place Name 3', 'price': '450'},
    {'image': 'assets/book5.jpg', 'name': 'Place Name 4', 'price': '450'},
    // Add more favorites here
  ];

  // List of recent properties
  final List<Map<String, dynamic>> recentProperties = [
    {'image': 'assets/book1.jpg', 'name': 'PARK HYATT SIEM REAP', 'price': '300'},
    {'image': 'assets/book2.jpg', 'name': 'ROSEWOOD PHNOM PENH', 'price': '350'},
    {'image': 'assets/book3.jpg', 'name': 'AMANSARA, SIEM REAP', 'price': '400'},
    {'image': 'assets/book4.jpg', 'name': 'KOH RONG ARCHIPELAGO', 'price': '400'},
    {'image': 'assets/book5.jpg', 'name': 'KOH RONG ARCHIPELAGO', 'price': '350'},
    // Add more recent properties here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF249689),
        title: const Text(
          "Booking Now",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Icon(Icons.account_circle, size: 40, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: buildBoxDecoration(),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: ' Search',
                        fillColor: Colors.white,
                        filled: false,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        contentPadding: EdgeInsets.all(15),
                        suffixIcon: Icon(Icons.tune),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Location",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 24, 105, 96)),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 100, // Adjust the height as needed
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Container(
                                height: 55,
                                width: 55,
                                decoration: buildBoxDecoration(),
                                child: Icon(
                                  item['icon'],
                                  size: 30.0,
                                  color: Color(0xFF249689),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                item['text'],
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF249689)),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Favorites",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 24, 105, 96)),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 190,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: favorites.length,
                      itemBuilder: (context, index) {
                        final favorite = favorites[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              Container(
                                height: 180,
                                width: 180,
                                decoration: buildBoxDecoration(),
                                child: Column(
                                  children: [
                                    SizedBox(height: 5,),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                            favorite['image'],
                                            width: 170,
                                            height: 120,
                                            fit: BoxFit.cover,
                                          ),
                                          Positioned(
                                            top: 5,
                                            left: 5,
                                            child: Row(
                                              children: <Widget>[
                                                Icon(Icons.star, color: Colors.yellow, size: 20),
                                                Icon(Icons.star, color: Colors.yellow, size: 20),
                                                Icon(Icons.star, color: Colors.yellow, size: 20),
                                                Icon(Icons.star, color: Colors.grey, size: 20),
                                                Icon(Icons.star, color: Colors.grey, size: 20),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            top: 5,
                                            right: 5,
                                            child: Icon(Icons.favorite, color: const Color.fromARGB(255, 120, 12, 4), size: 25),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:CrossAxisAlignment.start ,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                              child: Text(
                                                favorite['name'],
                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                              child: RichText(
                                                text: TextSpan(
                                                  text: '\$ ${favorite['price']}',
                                                  style: TextStyle(color: Colors.blue, fontSize: 14),
                                                  children: [
                                                    TextSpan(
                                                      text: " / night",
                                                      style: TextStyle(color: Colors.black, fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Recents Properties",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 24, 105, 96)),
                  ),
                  SizedBox(height: 5),
                  for (final recentProperty in recentProperties)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 3),
                    child: Container(
                      width: double.infinity,
                      height: 250,
                      decoration: buildBoxDecoration(),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    recentProperty['image'],
                                    width: double.infinity,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 5,
                                  right: 5,
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 130,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.white54, // Specify the color of the border
                                        width: 1, // Specify the width of the border
                                      ),
                                      color: Colors.white30, // Set the background color of the container
                                    ),
                                    child: Text(
                                      "12 nights available",
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ),

                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      recentProperty['name'],
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    //SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: RichText(
                                        text: TextSpan(
                                          text: '\$ ${recentProperty['price']}',
                                          style: TextStyle(color: Colors.blue, fontSize: 14),
                                          children: [
                                            TextSpan(
                                              text: " / night",
                                              style: TextStyle(color: Colors.black, fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ButtonNavigationBar(),
    );
  }
}

