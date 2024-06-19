
import 'package:booking_room/Pages/Verify.dart';
import 'package:booking_room/Pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

TextEditingController _controller = TextEditingController();
bool _isNumber = false;
bool checkText= false;

@override
void initState() {
  super.initState();
  _controller.addListener(_checkInputType);
}

void _checkInputType() {
  setState(() {
    // Check if the entered value is a number
    _isNumber = isNumeric(_controller.text);
  });
}

bool isNumeric(String value) {
  // Check if the value can be parsed as a number
  return double.tryParse(value) != null;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginForm()),
            );
          },
        ),
      
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            Text(
              "Forgot password",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),
            Text(
              "Please enter your Email/Phone Number.",
                style: TextStyle(
                  fontSize: 15,
                   color: const Color.fromARGB(255, 129, 121, 121),
                ),
            ),
            Text(
                "EX: 0123456789 / soklin168@gmail.com",
                style: TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 129, 121, 121),
                ),
              ),
            SizedBox(height: 20,),
            Text(
              "Email/Phone Number",
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _controller,
                decoration: InputDecoration(
                  prefixIcon: _isNumber ? Icon(Icons.phone) : Icon(Icons.message), // Icon for the text field
                  //labelText: 'Password ', // Optional label text
                  hintText: 'Email / Phone Number', // Placeholder text
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0)),
                  contentPadding: EdgeInsets.all(15),
                ),
              ),

            SizedBox(height: 5,),
            SizedBox(
              height: checkText? 30: 0,
              child: Row(
                children: [
                  checkText ? Icon(Icons.cancel, color: Color(0xFF249689), size: 17) : SizedBox(),
                  Text(" This Phone Number has been used, Please try again!", style: TextStyle(color: Color(0xFF249689)),),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFF249689),
              ),
              child: SizedBox(
                width: double.infinity, // Specify the width of the Container
                height: 60,
                child: TextButton(
                  
                  onPressed: () {
                    String doubleCheck =_controller.text;
                    if(doubleCheck=="0123456789" || doubleCheck=="soklin168@gmail.com"){
                      setState(() {
                        checkText=false;
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => VerifyEmail()),
                        );
                      });
                    }
                    else{
                      setState(() {
                        checkText=true;
                       
                      });
                    }
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  
  }
}