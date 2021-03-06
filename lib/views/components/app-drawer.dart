import 'package:flutter/material.dart';
import 'package:shopping_for_friends/views/Product/productList.dart';
import 'package:shopping_for_friends/views/friends/friends_list.dart';
import 'package:shopping_for_friends/views/list/my_list.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent[400],
            ),
            child: Text(
              'Shooping friends',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('Product List'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ProductList()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.receipt),
            title: Text('My Shopping List'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MyList()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Friend\'s Shopping List'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => FriendsShoppingList()),
              );
            },
          ),
        ],
      ),
    );
  }
}
