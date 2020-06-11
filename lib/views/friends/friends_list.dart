import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_for_friends/services/firebase.dart';
import 'package:shopping_for_friends/views/components/friend-tile.dart';

import '../../locator.dart';

class FriendsShoppingList extends StatelessWidget {

  AuthService _auth = locator<AuthService>();
  
  
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
        stream: _auth.getCollection(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return new ListView(children: getFriends(snapshot));
        });

//    return Scaffold(
//      body: _list(),
//    );
  }


  getFriends(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data.documents
        .map((doc) =>  FriendTile(name: doc["name"], price: doc["total"]+ .0, uid: doc.documentID))
        .toList();
  }


}
