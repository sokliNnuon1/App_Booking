
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  TextEditingController _inputPassword = TextEditingController();
  TextEditingController _reEnter=TextEditingController();
  
  bool setPassword = true;
 
  bool setConform = false;
  bool sizeBoxshow =false;
    
  bool _password = true;
  bool _passwords = true;
  @override
  Widget build(BuildContext context) {

  String newPassword = _inputPassword.text;
    if (newPassword.isEmpty) {
      setPassword = true;
    } else {
      if (newPassword.length < 8) {
        setPassword = true;
      } else {
        setPassword = false;
      }
    }
    var conForm="";
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute(
            //     builder: (context) =>VerifyEmail(),
            //   ),
            // );
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.all(15),
      
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // the start row
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                    "Set a new password",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    //margin: EdgeInsets.only(left: 20,top: 10),
                    child: Text(
                      "Create a password Ensure defferencts from ",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    child: Row(
                      children: [
                        Text(
                          "previous ones for security",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start, // the start row
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          child: Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: TextField(
                            controller: _inputPassword,
                            obscureText: _passwords,
                            
                            decoration: InputDecoration(
                              prefixIcon:Icon(Icons.lock), // Icon for the text field
                              //labelText: 'Password ', // Optional label text
                              hintText: 'enter password', // Placeholder text
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13.0)
                              ),
                              contentPadding: EdgeInsets.all(15),
                              suffixIcon: IconButton(
                                icon: Icon(_passwords? Icons.visibility : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _passwords = !_passwords; // Toggle password visibility
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        if (sizeBoxshow)
                        SizedBox(
                          height: 30, // Fixed height for the SizedBox
                          child: Row(
                            children: [
                              Icon(
                                newPassword.isEmpty
                                    ? Icons.error_outline_outlined
                                    : (setPassword ? Icons.cancel : Icons.check),
                                color: newPassword.isEmpty
                                    ? Colors.blue
                                    : (setPassword ? Colors.red : Colors.green),
                              ),
                              Text(
                                " Must be at least 8 characters",
                                style: TextStyle(
                                  color: newPassword.isEmpty
                                      ? Colors.blue
                                      : (setPassword ? Colors.red : Colors.green),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "Conform Password",
                            style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: TextField(
                            obscureText: _password,
                            controller: _reEnter,
                            decoration: InputDecoration(
                              prefixIcon:
                                Icon(Icons.lock), // Icon for the text field
                              //labelText:'Conform Password ', // Optional label text
                              hintText: 're-enter password', // Placeholder text
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13.0)
                              ),
                              contentPadding: EdgeInsets.all(15),
                              suffixIcon: IconButton(
                                icon: Icon(_password ? Icons.visibility : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _password =!_password; // Toggle password visibility
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        if (sizeBoxshow)
                          SizedBox(
                            height: setConform? 30: 0,
                            child: Row(
                              children: [
                                setConform? 
                                 Icon(Icons.cancel , color: const Color.fromARGB(255, 150, 10, 0),)
                                  : SizedBox(),
                                Text(
                                  (conForm.length==newPassword && conForm.length>=8 && newPassword.length >= 8)?
                                  "": " Conform password does not match",
                                  style: TextStyle( color: const Color.fromARGB(255, 150, 10, 0), fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        // loign b
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(255, 150, 10, 0),
                          ),
                          child: SizedBox(
                            width: double.infinity, // Specify the width of the Container
                            height: 60,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  sizeBoxshow=true;
                                });  
                                var conForm =_reEnter.text;
                                    // ignore: unrelated_type_equality_checks
                                  if(conForm == newPassword && conForm.length >= 8 && newPassword.length >= 8){
                                    setState(() {
                                      setConform=false;
                                    });
                                  }
                                  else{
                                    setState(() {
                                      setConform=true;
                                    });
                                  }
                                print('Button pressed');
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      
      ),
    );
  }
}
