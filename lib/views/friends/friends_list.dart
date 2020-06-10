import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_for_friends/models/friend.dart';
import 'package:shopping_for_friends/models/user.dart';
import 'package:shopping_for_friends/services/firebase.dart';
import 'package:shopping_for_friends/views/components/friend-tile.dart';

import '../../locator.dart';

class FriendsShoppingList extends StatelessWidget {

  AuthService _auth = locator<AuthService>();
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _list(),
    );
  }

  Widget _list() {
    print(_auth.currentUser.name);
    return ListView.builder(
      itemCount: _auth.currentUser.getFriendsList().length,//_auth.currentUser.getFriendsList().length,
      itemBuilder: (context, index) {
        var friend = _auth.currentUser.getFriend(index);//auth.currentUser.getFriend(index);
        return FriendTile(name: friend.name, price: friend.price.toString());
      },
    );
  }


}
