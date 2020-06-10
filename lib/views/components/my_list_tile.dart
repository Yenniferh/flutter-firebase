import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_for_friends/models/Product.dart';
import 'package:shopping_for_friends/models/cartModel.dart';


class MyListTile extends StatefulWidget {
  final Product p;

  MyListTile({this.p});

  @override
  _MyListTileState createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  final _formKey = GlobalKey<FormState>();
  String error = '';

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);
    int _n = 1;
    void add() {
      setState(() {
        _n++;
      });
    }
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        color: Colors.white,
        child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            leading: Icon(
              Icons.local_mall,
              size: 40,
            ),
            title: Text(widget.p.name),
            subtitle: Text(widget.p.price.toString()),
            trailing: SizedBox(
              width: 40,
              child:
              Form(
                key: _formKey,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: '1',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (val) => val.isEmpty ? 'Need  units' : null,
                  onChanged: (val) => change(val,cart),
                ),
              ),
            )
        )
    );
  }
  void change(val, cart){
    print(val);
    setState(() {
      print(cart.items[widget.p.id].name);
      print(cart.items[widget.p.id].quantity);
      cart.items[widget.p.id].changeQuantity(int.parse(val));
      print("change value");
      print("val"+val);
      print(cart.items[widget.p.id].quantity);
    });

  }
}
