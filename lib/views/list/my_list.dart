import 'package:flutter/material.dart';

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
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
