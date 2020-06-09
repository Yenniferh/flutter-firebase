import 'package:flutter/material.dart';
import 'package:shopping_for_friends/services/firebase.dart';
import 'package:shopping_for_friends/views/components/app-drawer.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: Colors.lightBlueAccent[50],
          appBar: AppBar(
            title: Text('Shopping 4 friends'),
            backgroundColor: Colors.lightBlueAccent[400],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
            ],
          ),
          drawer: AppDrawer()),
    );
  }
}
