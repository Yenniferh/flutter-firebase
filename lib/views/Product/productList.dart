import 'package:flutter/material.dart';
import 'package:shopping_for_friends/models/Product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = new List<Product>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product list"),
        backgroundColor: Colors.lightBlueAccent[400],
        elevation: 0.0,
      ),
      body: FutureBuilder(
        future: getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                var element = snapshot.data[index];
                return _item(element, index, context);
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
        },
      ),
      //floatingActionButton: new FloatingActionButton(
      //   onPressed: _addTodo, tooltip: 'Add task', child: new Icon(Icons.add)),
    );
  }
  //Get products of API
  Future<List<Product>> getProducts() async {
    final http.Response response = await http.get(
        'https://frutiland.herokuapp.com/search');
    print(
        'showProductService  => ${response.statusCode}');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<Product> productList = [];
      for (Map i in data) {
        print("index"+i["name"].toString());
        productList.add(Product.fromJson(i));
      }
      print('showProductsService length ${productList.length}');
      return productList;
    } else {
      return Future.error(response.statusCode.toString());
    }
  }

  Widget _item(Product element, int posicion, BuildContext context) {
    return Dismissible(key: UniqueKey(),
      onDismissed: (direction) {
        //courses.removeAt(posicion);
      },
      background: Container(color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child:
          Text("Deleting",
              style: TextStyle(fontSize: 15, color: Colors.white)
          ),
        ),
      ),
      child: Container(
        padding: new EdgeInsets.all(7.0),
        height: 100,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
         // color: element.completed == 1 ? Colors.blueGrey : Colors.white70,
          child: Center(
            child: ListTile(
              leading: _itemIcon(element),
              title: Text(element.name.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text('💲'+element.price.toString()),
              isThreeLine: true,
              onTap: ()=>_onTap(context, element, posicion),
            ),
          ),
        ),
      ),
    );
  }
  Widget _itemIcon(Product item){
    switch (item.category) {
      case "VERDURA":
        return Icon(Icons.local_florist, size: 45.0);
      case "LACTEO":
        return Icon(Icons.local_drink, size: 45.0);
      case "CARNE":
        return Icon(Icons.brightness_1, size: 45.0);
      case "LIMPIEZA":
        return Icon(Icons.local_laundry_service, size: 45.0);
      case "DESPENSA":
        return Icon(Icons.kitchen, size: 45.0);
      case "FRUTA":
        return Icon(Icons.local_florist, size: 45.0);
      case "SALUD":
        return Icon(Icons.healing, size: 45.0);
      default:
        return Icon(Icons.dialpad, size: 45.0);
    }
  }

  void _onTap(BuildContext context, Product location, int posicion ) {
    /*if (courses[posicion].completed == 0) {
      courses[posicion].completed = 1;
    } else{
      courses[posicion].completed = 0;
    }*/
  }
}
