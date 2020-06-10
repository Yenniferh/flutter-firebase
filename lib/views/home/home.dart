import 'package:flutter/material.dart';
import 'package:shopping_for_friends/services/firebase.dart';
import 'package:shopping_for_friends/views/Product/productList.dart';
import 'package:shopping_for_friends/views/authentication/signin.dart';
import 'package:shopping_for_friends/views/friends/friends_list.dart';
import 'package:shopping_for_friends/views/shopping/shopping_list.dart';
import '../../locator.dart';
import '../Product/productList.dart';

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
  int _currentIndex = 1;
  final List<Widget> _children = [
    ProductList(),
    FriendsShoppingList(),
    ShoppingList()
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
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped, // new
          currentIndex: _currentIndex,
          unselectedItemColor: Colors.grey[600],
          showUnselectedLabels: false,
          selectedItemColor: Colors.lightBlueAccent[400],
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              title: Text('Product List'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.group_add),
                title: Text("Friend's Shopping List")),
            BottomNavigationBarItem(
                icon: Icon(Icons.list), title: Text("Shopping List"))
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
