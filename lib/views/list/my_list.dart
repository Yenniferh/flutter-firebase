import 'package:flutter/material.dart';
import 'package:shopping_for_friends/views/components/my_list_tile.dart';

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: <Widget>[
          MyListTile(name: "Banana", price: "200 und"),
          MyListTile(name: "Huevo", price: "350 und"),
          MyListTile(name: "Cebolla", price: "300 und"),
        ],
      ),
    ));
  }
}
