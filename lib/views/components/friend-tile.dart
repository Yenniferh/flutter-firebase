import 'package:flutter/material.dart';
import 'package:shopping_for_friends/locator.dart';
import 'package:shopping_for_friends/services/firebase.dart';
import 'package:shopping_for_friends/views/components/button.dart';

class FriendTile extends StatefulWidget {
  final String name;
  final double price;
  final String uid;

  FriendTile({this.name, this.price, this.uid});

  @override
  _FriendTileState createState() => _FriendTileState();
}

class _FriendTileState extends State<FriendTile> {
  bool isChoosen = false;
  AuthService _auth = locator<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      color: isChoosen ? Colors.white60 : Colors.white,
      child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          leading: Icon(
            Icons.local_mall,
            size: 40,
          ),
          title: Text(widget.name),
          subtitle: Text(widget.price.toString()),
          trailing: isChoosen
              ? Button(
                  icon: Icon(
                    Icons.remove,
                    size: 17,
                  ),
                  color: Colors.redAccent[400],
                  tooltip: "Remove friend's list",
                  onPress: () {
                    print("Removed friend's list");
                    _auth.addFriendList(widget.uid, widget.price);
                    setState(() {
                      isChoosen = false;
                    });
                  },
                )
              : Button(
                  icon: Icon(
                    Icons.add,
                    size: 17,
                  ),
                  color: Colors.greenAccent[400],
                  tooltip: "Add friend's list",
                  onPress: () {
                    print("Added friend's list");
                    setState(() {
                      isChoosen = true;
                    });
                  },
                )),
    );
  }
}
