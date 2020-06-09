import 'package:flutter/material.dart';

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Friend's shopping list"),
          backgroundColor: Colors.lightBlueAccent[400],
          elevation: 0.0,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Text("Banana - 200 und"),
              Text("Cebolla - 300 und"),
              Text("Tomate - 300 und"),
            ],
          ),
        ));
  }
}
