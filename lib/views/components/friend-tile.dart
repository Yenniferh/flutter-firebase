import 'package:flutter/material.dart';

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
          trailing: isChoosen ? _button(0) : _button(1)),
    );
  }

  // type = 0 remove
  // type = 1  add
  Widget _button(int type) {
    return Padding(
        padding: EdgeInsets.only(right: 15),
        child: Ink(
          height: 35,
          width: 35,
          decoration: ShapeDecoration(
            color: type == 0 ? Colors.redAccent : Colors.greenAccent[400],
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: type == 0
                ? Icon(
                    Icons.remove,
                    size: 17,
                  )
                : Icon(
                    Icons.add,
                    size: 17,
                  ),
            color: Colors.white,
            onPressed: () {
              if (type == 0) {
                print("Removed friend's list");
                setState(() {
                  isChoosen = false;
                });
              } else {
                print("Added friend's list");
                setState(() {
                  isChoosen = true;
                });
              }
            },
          ),
        ));
  }
}
