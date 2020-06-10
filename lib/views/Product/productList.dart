import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_for_friends/models/Product.dart';
import 'dart:convert';
import 'package:shopping_for_friends/views/components/product-tile.dart';
import 'package:shopping_for_friends/views/list/mycart.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int i) {
                return _MyListItem(i);
              },
              childCount: 38,
            ),
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'My car',
        child: new Icon(Icons.shopping_cart),
        onPressed:(){
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => MyCart()),
          );
        },
      ),
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  _MyListItem(this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var catalog = Provider.of<ProductModel>(context, listen: false);
    //TODO verificar que este completa la lista
    catalog.getProducts();
    var item = catalog.getItem(index);
    return ProductTile(
      product: item,
      addProduct: () => print('${item.name} added'),
      delProduct: () => print("${item.name} deleted"),
    );
  }
}
