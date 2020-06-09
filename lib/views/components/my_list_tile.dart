import 'package:flutter/material.dart';

class MyListTile extends StatefulWidget {
  // Product p
  final String name;
  final String price;
  String quantity;

  MyListTile({this.name, this.price});

  @override
  _MyListTileState createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  final _formKey = GlobalKey<FormState>();
  String error = '';

  @override
  Widget build(BuildContext context) {
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
            title: Text(widget.name),
            subtitle: Text(widget.price),
            trailing: SizedBox(
              width: 40,
              child: Form(
                key: _formKey,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: '1',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => widget.quantity = val);
                    print(widget.quantity);
                  },
                ),
              ),
            )));
  }
}
