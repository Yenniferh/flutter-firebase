import 'package:flutter/material.dart';
import 'package:shopping_for_friends/services/firebase.dart';

import 'package:shopping_for_friends/views/components/app-drawer.dart';
import 'package:shopping_for_friends/views/Product/productList.dart';
import 'package:shopping_for_friends/views/friends/friends_list.dart';

import '../../locator.dart';
import '../Product/productList.dart';
import '../list/my_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}

class _HomeState extends State<Home> {
  final AuthService _auth = locator<AuthService>();
  int _currentIndex = 0;
  final List<Widget> _children = [
    MyList(),
    ProductList(),
    FriendsShoppingList()
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent[50],
        appBar: AppBar(
          title: Text('Shopping 4 friends'),
          backgroundColor: Colors.lightBlueAccent[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        /*  drawer: AppDrawer()
          ,  */
          body:_children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped, // new
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.list),
              title: new Text('My list'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.shopping_basket),
              title: new Text('Product List'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text("My friend's lists"))
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
