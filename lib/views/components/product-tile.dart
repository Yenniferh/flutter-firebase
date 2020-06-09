import 'package:flutter/material.dart';
import 'package:shopping_for_friends/models/Product.dart';

class ProductTile extends StatefulWidget {
  final Product product;
  final Function addProduct;
  final Function delProduct;

  ProductTile({this.product, this.addProduct, this.delProduct});

  @override
  _ProductTileState createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(7.0),
      height: 100,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        margin: EdgeInsets.all(2),
        color: isAdded ? Colors.green[200] : Colors.white,
        child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            leading: _itemIcon(widget.product),
            title: Text(
              widget.product.name.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('💲' + widget.product.price.toString()),
            isThreeLine: true,
            trailing: isAdded
                ? (IconButton(
                    icon: Icon(Icons.remove),
                    color: Colors.redAccent[700],
                    tooltip: "Remove from list",
                    onPressed: () {
                      widget.delProduct();
                      setState(() {
                        isAdded = false;
                      });
                    },
                  ))
                : (IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.green[300],
                    tooltip: "Add to list",
                    onPressed: () {
                      widget.addProduct();
                      setState(() {
                        isAdded = true;
                      });
                    },
                  ))),
      ),
    );
  }

  Widget _itemIcon(Product item) {
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
}
