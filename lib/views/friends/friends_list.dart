import 'package:flutter/material.dart';
import 'package:shopping_for_friends/views/components/friend-tile.dart';

class FriendsShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
          child: Column(
        children: <Widget>[
          FriendTile(
            name: "Carolina",
            price: "20.000",
          ),
          FriendTile(
            name: "Carlos",
            price: "25.000",
          ),
        ],
      )),
    );
  }
}
