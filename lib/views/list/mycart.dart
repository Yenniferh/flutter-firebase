// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_for_friends/models/Product.dart';
import 'package:shopping_for_friends/models/cartModel.dart';
import 'package:shopping_for_friends/views/components/my_list_tile.dart';

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
class _Post extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);
    int total =0;
    cart.mapCars.forEach((e,v) =>total =(total + v*cart.items[e].price.toInt()));
    return SizedBox(
      height: 100,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Total"+'💲' +total.toString(), style:
                  TextStyle(color: Colors.teal, fontSize: 20, fontStyle: FontStyle.italic),),
            SizedBox(width: 54),
            FlatButton(
              onPressed: () {
                _showDialog(context);
              },
              color: Colors.blue,
              child: Text('Post'),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Finish"),
          content: new Text("I'm ready for share!"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Perfect"),
              onPressed: () {
                //TODO ADD FIREBASE AND SHOW IN SHOPPING
                Navigator.of(context).pop();
                //Scaffold.of(context).showSnackBar(
                //   SnackBar(content: Text('Ready.')));
              },
            ),
            new FlatButton(
              child: new Text("More"),
              onPressed: () {
                /*Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('No ready.')));*/
                Navigator.of(context).pop();

              },
            ),
          ],
        );
      },
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
            MyListTile(p: cart.items[index], value: cart.mapCars[index],)
    );
  }
}

