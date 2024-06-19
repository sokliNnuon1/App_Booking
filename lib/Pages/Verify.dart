
import 'dart:math';
import 'package:booking_room/Pages/HomeSreen.dart';
import 'package:booking_room/Pages/forGetPass.dart';
import 'package:flutter/rendering.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class VerifyEmail extends StatefulWidget {

  // String GetData;// get email from 
  //  VerifyEmail({required this.GetData});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
final defaultPinTheme = PinTheme(
    width: 56,
    height: 60,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Colors.black,
    ),
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: const Color.fromARGB(255, 205, 202, 202), width: 2),
    ),
  );
  TextEditingController pinController = TextEditingController();
  String validationMessage = ''; // Validation message initially empty
  bool isvalidOTP =false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
     final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color:  const Color.fromARGB(255, 205, 202, 202), width: 2),
      ),
    );
    //final String email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            Navigator.of(context).pushReplacement(   MaterialPageRoute(builder: (context) =>const ForgetPassword(),   )  );
          },
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // the start row
                  children: [
                    Container(
                      child:  Text(
                      "Check your Message",
                      style:  TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    Container(
                      //margin: EdgeInsets.only(left: 20,top: 5),
                      child: Row(
                        children: [
                          Text(
                            "We sent code to your message ",
                           style: TextStyle(
                              fontSize: 15,
                               color: Colors.grey
                            ),
                          ),
                          Text(
                            "0123456789",
                            style: TextStyle(
                              fontSize: 15, 
                              fontWeight: FontWeight.w200
                            ),  
                          )
                        ],
                      ),
                    ),
                    Container(
                      //margin: EdgeInsets.only(left: 20,top: 5),
                      child: Row(
                        children: [
                          Text(
                            "enter 5 degits code that mentioned in the message",
                            style: TextStyle(
                              fontSize: 15,
                               color: Colors.grey
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                margin: EdgeInsets.only(left: 20, top: 5, right: 10),
              ),
              SizedBox(height: 15,),
              // textFieldBox
              Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Pinput(
                      length: 5,
                      keyboardType: TextInputType.number,
                      controller: pinController,
                      defaultPinTheme: defaultPinTheme,
                      pinputAutovalidateMode: PinputAutovalidateMode.disabled,
                      textInputAction: TextInputAction.next,
                      showCursor: true,
                      onCompleted: (pin) {},
                    ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFF249689),
                ),
                child: SizedBox(
                  width: double.infinity, // Specify the width of the Container
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      int validDigit = 12345; // Valid pin digit
                      int enteredPin = int.tryParse(pinController.text) ?? -1; // Get entered pin from controller
                      if (enteredPin == validDigit) {
                        setState(() {
                           Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomeScreen()),
                            );
                        });
                      } else {
                        setState(() {
                         print("false");// Update validation message
                        });
                      }
                    },
                    child: Text(
                      'Verify Code',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              //resendemail
              Container(
                margin:
                EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Haven't got the email yet?",
                      style: TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        // Add your onPressed logic here
                        print("Login button pressed");
                      },
                      child: Text(
                        "Resend code",
                        style: TextStyle(
                            color: Color.fromARGB(255, 150, 10, 0), // Change the color to your desired link color
                            decoration:
                                TextDecoration.underline, // Underline the text
                            fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

