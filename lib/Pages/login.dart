
import 'package:booking_room/Pages/HomeSreen.dart';
import 'package:booking_room/Pages/forGetPass.dart';
import 'package:booking_room/Pages/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController passCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  bool _password = true;
  bool emailError = false;
  bool validationTxt = false;
  bool passwordError = false;
  double H = 64;
  double W = 366;
  String txtEmail = "soklin128@gmail.com";
  String txtPhone = "0123456789";

  @override
  void initState() {
    super.initState();

    // Add listeners to controllers to reset error state when the user starts typing
    emailCon.addListener(_resetEmailError);
    passCon.addListener(_resetPasswordError);
  }

  void _resetEmailError() {
    setState(() {
      emailError = false;
    });
  }

  void _resetPasswordError() {
    setState(() {
      passwordError = false;
    });
  }

  BoxDecoration buildDecorations() {
    // Create a BoxDecoration with only a blur effect
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(13.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
        ),
      ],
    );
  }

  OutlineInputBorder buildBorder({required bool isError}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: isError ? Colors.red : Colors.black,
        width: 2.0,
      ),
    );
  }

  void validateInput() {
  String emailText = emailCon.text;
  String passwordText = passCon.text;
  bool emailValid = false;
  bool passwordValid = false;
  
  if (emailText == txtPhone || emailText == txtEmail) {
    emailValid = true;
    validationTxt = false;
  } else {
    emailValid = false;
    validationTxt = true;
  }

  if (passwordText == txtPhone) {
    passwordValid = true;
    validationTxt = false;
  } else {
    passwordValid = false;
    validationTxt = true;
  }

  setState(() {
    emailError = !emailValid;
    passwordError = !passwordValid;
  });

  if (emailValid && passwordValid) {
    // Proceed with login
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              const Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  
                ),
              ),
              const Text(
                "Booking APP!",
                style: TextStyle(
                  fontSize: 14,
                  
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 24, top: 30, right: 24, bottom: 10),
                decoration: buildDecorations(),
                child: TextField(
                  controller: emailCon,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.message, size: 24),
                    hintText: 'Email',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: emailError ? BorderSide(color: Colors.red, width: 2) : BorderSide.none,
                    ),
                    focusedBorder: buildBorder(isError: emailError),
                    contentPadding: EdgeInsets.all(15),
                    hintStyle: TextStyle(fontSize: 16,  color: emailError ? Colors.black : null),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 24, top: 10, right: 24, bottom: 10),
                decoration: buildDecorations(),
                child: TextField(
                  obscureText: _password,
                  controller: passCon,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, size: 24),
                    hintText: 'Password',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: passwordError ? BorderSide(color: Colors.red, width: 2) : BorderSide.none,
                    ),
                    focusedBorder: buildBorder(isError: passwordError),
                    contentPadding: EdgeInsets.all(15),
                    hintStyle: TextStyle(fontSize: 16,  color: passwordError ? Colors.black : null),
                    suffixIcon: IconButton(
                      icon: Icon(_password ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _password = !_password;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      validationTxt ? "Invalid Username or Password. Try again!" : "",
                      style: TextStyle(
                        color: Color(0xFF249689),
                        
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgetPassword()),
                  );
                },
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    
                  ),
                ),
              ),
              SizedBox(height: 5),
              // Login button
              Container(
                width: W,
                height: H,
                margin: EdgeInsets.only(left: 24, top: 10, right: 24, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF249689),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      validateInput();
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              // Google login button
              Container(
                margin: EdgeInsets.only(left: 24, top: 0, right: 24, bottom: 0),
                child: Center(
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(12.0),
                    child: Container(
                      width: W,
                      height: H,
                      child: Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            margin: EdgeInsets.only(left: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Image.asset("assets/google.png", fit: BoxFit.cover),
                          ),
                          Expanded(
                            child: Text(
                              'Sign Up With Google',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Don't have an account?", style: TextStyle(fontSize: 14, fontFamily: 'Poppins')),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Sign_Up()),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color(0xFF249689),
                          fontSize: 14,
                          
                        ),
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
