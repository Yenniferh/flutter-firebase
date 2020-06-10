

import 'Product.dart';

class cartList {
  final int total;
  List<Product> products;

  cartList({this.total, this.products});

  factory cartList.fromJson(Map<String, dynamic> json) {
    var list = json['lista'] as List;
    List<Product> pList = list.map((i) => Product.fromJson(true,i['id'],i)).toList();
    return cartList(
        total: json['total'],
        products: pList
    );
  }


}