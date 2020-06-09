import 'package:flutter/material.dart';
import 'package:shopping_for_friends/models/Product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shopping_for_friends/views/components/product-tile.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = new List<Product>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: FutureBuilder(
        future: getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  Product element = snapshot.data[index];
                  return ProductTile(
                    product: element,
                    addProduct: () => print('${element.name} added'),
                    delProduct: () => print("${element.name} deleted"),
                  );
                },
              );
            } else {
              return Container(
                child: Center(
                  child: SizedBox(
                    child: CircularProgressIndicator(),
                    width: 60,
                    height: 60,
                  ),
                ),
              );
            }
          }
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.pink[300]),
            ),
          );
        },
      ),
    );
  }

  //Get products of API
  Future<List<Product>> getProducts() async {
    final http.Response response =
        await http.get('https://frutiland.herokuapp.com/search');
    print('showProductService  => ${response.statusCode}');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<Product> productList = [];
      for (Map i in data) {
        print("index" + i["name"].toString());
        productList.add(Product.fromJson(i));
      }
      print('showProductsService length ${productList.length}');
      return productList;
    } else {
      return Future.error(response.statusCode.toString());
    }
  }
}
