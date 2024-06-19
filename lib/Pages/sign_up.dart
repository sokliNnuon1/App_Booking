

import 'package:booking_room/Pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Sign_Up extends StatefulWidget {
   Sign_Up({super.key});

    
  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {

  TextEditingController _Fullname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _passwordCon = TextEditingController();
  TextEditingController _conPassword = TextEditingController();

  bool _password = true;
 bool _conpassword = true;
  bool checkName = false;
  bool checkEmail=false;
  bool checkPassword =false;
  

void condition() {
    String Fullname = _Fullname.text;
    String Emails = _email.text;
    String passwords = _passwordCon.text;
    String Conpass = _conPassword.text;

    setState(() {
      if (Fullname == "Soklin") {
        checkName = true;
        checkEmail = false;
        checkPassword = false;
      } else {
        checkName = false;
        if (Emails == "soklin128@gmail.com") {
          checkEmail = true;
          checkPassword = false;
        } else {
          checkEmail = false;
          if ((passwords==Conpass) && (passwords.length<8)) {
            checkPassword = true;
           
          } else {
            checkPassword = false;
            
          }
        }
      }
      if(_passwordCon==_conPassword) {
                            Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) => LoginForm(),  ) );
                          }
    });
  }
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) =>const LoginForm(),   )  );
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
               const Text(
                  "Find your dream car!",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 5, right: 20, bottom: 10),  // Add margin to the container
                  child:  TextField(
                    controller: _Fullname,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person), // Icon for the text field
                      hintText: 'Funll Name ', // Placeholder text
                      //labelText: 'Full name', // Optional label text
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(196, 194, 194, 1), // Custom border color
                        ),
                        ),
                      //contentPadding: EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 15),
                      contentPadding: EdgeInsets.all(15),
                      //BoxDecoration: 
                    ),
                  ),
                ),
                //TextEmail
                Container(
                  margin: EdgeInsets.only(left: 20, top: 5, right: 20, bottom: 10), // Add margin to the container
                  child:  TextField(
                    controller: _email,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.message), // Icon for the text field
                     hintText: 'Email / Phone Number', // Placeholder text
                      //labelText: 'Email / Phone Number', // Optional label text
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0)),
                      contentPadding: EdgeInsets.all(15)
                    ),
                  ),
                ),
                //TextPassword
                Container(
                  margin: EdgeInsets.only(left: 20, top: 5, right: 20, bottom: 10), // Add margin to the container
                  child:  TextField(
                    controller: _passwordCon,
                    obscureText: _password,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock), // Icon for the text field
                      //labelText: 'Password ', // Optional label text
                      hintText: 'password', // Placeholder text
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0)),
                      contentPadding: EdgeInsets.all(15),
                      suffixIcon: IconButton(
                        icon: Icon(_password ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _password = !_password; // Toggle password visibility
                          });
                        },
                      ),
                    ),
                  ),
                ),
                //TextComform
                Container(
                  margin: EdgeInsets.only(left: 20, top: 5, right: 20, bottom: 5), // Add margin to the container
                  child:  TextField(
                    controller: _conPassword,
                    obscureText: _conpassword,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock), // Icon for the text field
                      //labelText: 'Comform Password ', // Optional label text
                      hintText: 'Comform password', // Placeholder text
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0)),
                      contentPadding: EdgeInsets.all(15),
                      suffixIcon: IconButton(
                      icon: Icon(_conpassword ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _conpassword = !_conpassword; // Toggle password visibility
                        });
                      },
                    ),
                    ),
                  ),
                ),
               Container(
                margin: EdgeInsets.only(left: 20, bottom: 5),
                  child: Row(
                    children: [
                      SizedBox(height: 20),
                        Text(
                          checkName? "Invalid Name, Please cheack again!": (checkEmail? "This Email has been used. Try again!": (checkPassword? "Take a strong password": "")),
                          style: TextStyle(fontSize: 13, color: Color(0xFF249689)),
                        ),
                    ],
                  ),
                ),
                // loign b 
               Container(
                  margin: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFF249689),
                  ),
                  child: SizedBox(
                    width: double.infinity, // Specify the width of the Container
                    height: 60,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          condition();
                        });
                        
                       //Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) =>const SingUpFullName(),  ) );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                // line for 
                Container(
                  margin:  EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 0), 
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), // Border radius
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                      Text("  Or  "),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                      )
                      
                    ],
                  ),
                ),
                //googlelogin
              Container(
                margin:  EdgeInsets.only(left: 20, top: 5, right: 20, bottom: 0), 
                child: Center(
                  child: Material(             
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(12.0),
                    child: InkWell(
                        child: Container(
                          // width: 350,
                          height: 50,
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                margin: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                  child: Image.asset("assets/google.png",fit: BoxFit.cover,),
                                ),
                                Expanded(
                                  child:Text('Sing Up With Google',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                      
                                  ),
                                )
                              )
                            ],
                          ),
                        ),
                        onTap:() {
                        //Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) =>const (),  ) );
                      },
                    ),
                  ),           
                ),
              ),
              
              Container(
                margin: EdgeInsets.only(left: 20, top: 5, right: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                    Text("Already have an account?", style: TextStyle(fontSize: 17),),
                    MouseRegion(
                      cursor: SystemMouseCursors.click, // Change to the desired cursor type
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginForm()),
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.blue, // Change the color to your desired link color
                            decoration: TextDecoration.underline, // Underline the text
                            fontSize: 17
                          ),
                        ),
                      ),
                    )
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
