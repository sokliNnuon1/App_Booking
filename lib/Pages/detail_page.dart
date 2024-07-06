import 'package:booking_room/Pages/HomeSreen.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 40,), // Back icon with white color
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) =>HomeScreen(),
              ),
            );
          },
        ),
        actions: const [
          Icon(Icons.more_vert_outlined, color: Colors.black, size: 40,),
          SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset("assets/book1.jpg", height: 260, fit: BoxFit.cover)
              ),
              SizedBox(height: 10,),
              Text("Location, Address", style: TextStyle(fontSize: 16),),
              Text("Location Name", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text("A small description about this card that helps users understand the importance of what makes this so special.", style: TextStyle(fontSize: 16),),
              SizedBox(height: 10,),
              const Divider(
                color: Colors.grey, 
                height: 1,
                thickness: 1,
              ),
              SizedBox(height: 10,),
              Text("Duration (# of nights)"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Text("Check In"),
                        SizedBox(height: 5,),
                        Container(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: ' Date',
                              fillColor: Colors.white,
                              filled: false,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              contentPadding: EdgeInsets.all(15),
                              suffixIcon: Icon(Icons.date_range, size: 40,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_right_alt_outlined, size: 35,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Text("Check Out"),
                        SizedBox(height: 5,),
                        Container(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: ' Date',
                              fillColor: Colors.white,
                              filled: false,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              contentPadding: EdgeInsets.all(15),
                              suffixIcon: Icon(Icons.date_range, size: 35,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              const Divider(
                color: Colors.grey, 
                height: 1,
                thickness: 1,
              ),
              const SizedBox(height: 10,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Your Total : ", style: TextStyle(fontSize: 25),),
                  Column(
                    children: [
                      Text("\$ 150" , style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 75, 57, 239)),),
                      Text("150\$ /night"),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 75, 57, 239),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: TextButton(
                    onPressed: () {
                      // Add your booking logic here
                    },
                    child: const Text(
                      'Booking Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
