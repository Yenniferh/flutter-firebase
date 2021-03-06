import 'package:flutter/material.dart';
import 'package:shopping_for_friends/views/authentication/signin.dart';
import 'package:shopping_for_friends/views/authentication/signup.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView(){
    //print(showSignIn.toString());
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView:  toggleView);
    } else {
      return SignUp(toggleView:  toggleView);
    }
  }
}