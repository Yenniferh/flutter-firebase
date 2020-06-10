import 'package:flutter/material.dart';
import 'package:shopping_for_friends/services/firebase.dart';

import '../../locator.dart';

class ShoppingList extends StatelessWidget {
  
  const ShoppingList({Key key}) : super(key: key);
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text("My Shopping List",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54)),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Text(
                      "My items",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(0),
                    color: Colors.white,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: <Widget>[
                          ListTile(
                            title: Text("Banana"),
                            subtitle: Text("200/und * 12"),
                          ),
                          ListTile(
                            title: Text("Huevo"),
                            subtitle: Text("350/und * 30"),
                          ),
                          ListTile(
                            title: Text("Atún"),
                            subtitle: Text("3800/und * 3"),
                          ),
                          ListTile(
                            title: Text("Cebolla"),
                            subtitle: Text("300/und * 12"),
                          ),
                        ],
                      ),
                    ),

                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Text(
                      "Total: \$25.000",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text("My Friend's Shopping List",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54)),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Text(
                      "Carlos",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(0),
                    color: Colors.white,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: <Widget>[
                          ListTile(
                            title: Text("Banana"),
                            subtitle: Text("200/und * 12"),
                          ),
                          ListTile(
                            title: Text("Huevo"),
                            subtitle: Text("350/und * 30"),
                          ),
                          ListTile(
                            title: Text("Atún"),
                            subtitle: Text("3800/und * 3"),
                          ),
                          ListTile(
                            title: Text("Cebolla"),
                            subtitle: Text("300/und * 12"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Text(
                      "Total: \$25.000",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Text(
                      "Julia",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(0),
                    color: Colors.white,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: <Widget>[
                          ListTile(
                            title: Text("Banana"),
                            subtitle: Text("200/und * 12"),
                          ),
                          ListTile(
                            title: Text("Huevo"),
                            subtitle: Text("350/und * 30"),
                          ),
                          ListTile(
                            title: Text("Atún"),
                            subtitle: Text("3800/und * 3"),
                          ),
                          ListTile(
                            title: Text("Cebolla"),
                            subtitle: Text("300/und * 12"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Text(
                      "Total: \$25.000",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Text(
                      "Robert",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(0),
                    color: Colors.white,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: <Widget>[
                          ListTile(
                            title: Text("Banana"),
                            subtitle: Text("200/und * 12"),
                          ),
                          ListTile(
                            title: Text("Huevo"),
                            subtitle: Text("350/und * 30"),
                          ),
                          ListTile(
                            title: Text("Atún"),
                            subtitle: Text("3800/und * 3"),
                          ),
                          ListTile(
                            title: Text("Cebolla"),
                            subtitle: Text("300/und * 12"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Text(
                      "Total: \$25.000",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Text(
                      "Javier",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(0),
                    color: Colors.white,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: <Widget>[
                          ListTile(
                            title: Text("Banana"),
                            subtitle: Text("200/und * 12"),
                          ),
                          ListTile(
                            title: Text("Huevo"),
                            subtitle: Text("350/und * 30"),
                          ),
                          ListTile(
                            title: Text("Atún"),
                            subtitle: Text("3800/und * 3"),
                          ),
                          ListTile(
                            title: Text("Cebolla"),
                            subtitle: Text("300/und * 12"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Text(
                      "Total: \$25.000",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Text(
                      "Mario",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(0),
                    color: Colors.white,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: <Widget>[
                          ListTile(
                            title: Text("Banana"),
                            subtitle: Text("200/und * 12"),
                          ),
                          ListTile(
                            title: Text("Huevo"),
                            subtitle: Text("350/und * 30"),
                          ),
                          ListTile(
                            title: Text("Atún"),
                            subtitle: Text("3800/und * 3"),
                          ),
                          ListTile(
                            title: Text("Cebolla"),
                            subtitle: Text("300/und * 12"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Text(
                      "Total: \$25.000",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Total: \$150.000",
                style: TextStyle(color: Colors.redAccent[400], fontSize: 24),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        )
      ],
    )
    ,floatingActionButton: new FloatingActionButton(
        tooltip: 'My car',
        child: new Icon(Icons.shopping_cart),
        onPressed:(){
        final AuthService _auth = locator<AuthService>();
        _auth.getMyList();
        },
      ),);
  }
}
