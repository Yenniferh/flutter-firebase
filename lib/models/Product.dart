import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductModel {
  List<Product> products = new List<Product>();
  //Get List API
  Future<List<Product>> getProducts() async {
    final http.Response response =
    await http.get('https://frutiland.herokuapp.com/search');
    print('showProductService  => ${response.statusCode}');
    int j=0;
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<Product> productList = [];
      for (Map i in data) {
        productList.add(Product.fromJson(j,i));
        j=j+1;
      }
      products = productList;
    } else {
      print(Future.error(response.statusCode.toString()));
    }
  }

  Product getItem(int i){
    return products[i];
  }
}



class Product {
  int id;
  String name;
  double price;
  String category;
  int quantity;

  Product.initial()
      : id=0,
        name = 'probando',
        price = 0,
        category = '',
        quantity=0;

  Product({ this.id, this.name, this.price, this.category, this.quantity });

  void changeQuantity(int q){
    this.quantity=q;
  }
  factory Product.fromJson(int i,Map<String, dynamic> json) {
    return Product(
        id: i,
        name: json['name'],
        price: json['price'],
        category: json['category'],
        quantity: 0
    );
  }

  toJson() {

    return {
      'id':this.id,
      'name':this.name,
      'price':this.price,
      'category':this.category,
      'quantity':this.quantity
    };
  }


}