// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_for_friends/models/Product.dart';
import 'package:shopping_for_friends/models/cartModel.dart';
import 'package:shopping_for_friends/services/firebase.dart';
import 'package:shopping_for_friends/views/components/my_list_tile.dart';
import '../../locator.dart';


class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
            Divider(height: 4, color: Colors.black),
            _Post()
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);

    return ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) =>
            MyListTile(p: cart.items[index], value: cart.mapCarts[index],)
    );
  }
}

class _Post extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);
    int total =0;
    cart.mapCarts.forEach((e,v) =>total =(total + v*cart.items[e].price.toInt()));
    cart.items.forEach((e) => e.quantity=cart.mapCarts[e.id]);
    return SizedBox(
      height: 100,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Total"+'💲' +total.toString(), style:
                  TextStyle(color: Colors.teal, fontSize: 20,
                            fontStyle: FontStyle.italic),),
            SizedBox(width: 54),
            FlatButton(
              onPressed: ()=>_showDialog(context, cart.items,total),
              color: Colors.blue,
              child: Text('Post'),
            ),
          ],
        ),
      ),
    );
  }

  void addToFirebase(List<Product> items ,int total){
    final AuthService _auth = locator<AuthService>();
    _auth.addListToFirestore(items, total);
  }

   void _showDialog(BuildContext context,List<Product> items ,int total) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Finish"),
          content: new Text("I'm ready for share!"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Perfect"),
              onPressed: () {
                //TODO ADD FIREBASE AND SHOW IN SHOPPING
                addToFirebase(items,total);
                print("added firebase");
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("More"),
              onPressed: () {
                Navigator.of(context).pop();

              },
            ),
          ],
        );
      },
    );
  }
}


