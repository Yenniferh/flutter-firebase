import 'package:flutter/material.dart';
import 'package:shopping_for_friends/views/components/button.dart';

class FriendTile extends StatefulWidget {
  final String name;
  final String price;

  FriendTile({this.name, this.price});

  @override
  _FriendTileState createState() => _FriendTileState();
}

class _FriendTileState extends State<FriendTile> {
  bool isChoosen = false;

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
          subtitle: Text(widget.price),
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

  /* if (type == 0) {
                print("Removed friend's list");
                setState(() {
                  isChoosen = false;
                });
              } else {
                print("Added friend's list");
                setState(() {
                  isChoosen = true;
                });
              } */
}
