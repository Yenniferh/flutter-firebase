import 'package:flutter/material.dart';
import 'package:shopping_for_friends/models/Product.dart';
import 'package:shopping_for_friends/views/components/my_list_tile.dart';

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              MyListTile(p: Product(id: 1,
                  name: "Pan",
                  price: 200,
                  category: "COMIDA",
                  quantity: 0
              )),
              MyListTile(p: Product(id: 1,
                  name: "Huevo",
                  price: 300,
                  category: "COMIDA",
                  quantity: 0
              )),

            ],
          ),
        ));
  }
}
