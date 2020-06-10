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
            _CartTotal()
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
        itemBuilder: (context, index) => MyListTile(p: cart.items[index]));
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CartModel>(
                builder: (context, cart, child) => Column(
                      children: <Widget>[
                        Text(
                          '\$${totalPrice(cart.items)}'
                          "Total", /*style: hugeStyle*/
                        ),
                        SizedBox(width: 24),
                        FlatButton(
                          onPressed: () {
                            final AuthService _auth = locator<AuthService>();
                            _auth.addListToFirestore(cart.items);
                            _auth.getLists();
                             Navigator.of(context).pop();
                          },
                          color: Colors.blue,
                          child: Text('Post'),
                        ),
                      ],
                    )),
          ],
        ),
      ),
    );
  }

  totalPrice(List<Product> items) {
    int total = 0;
    items.forEach(
        (e) => total = (total + e.quantity /*e.price.toInt()*/) as int);
    return total;
  }
}
