import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_for_friends/views/wrapper.dart';
import 'locator.dart';
import 'models/Product.dart';
import 'models/cartModel.dart';
import 'models/user.dart';
import 'services/firebase.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return /*StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );*/
    MultiProvider(
      providers: [
        StreamProvider(create: (context)=>AuthService().user),
        Provider(create: (context) => ProductModel()),
        //StreamProvider<User>.value(value: AuthService().user),
        ChangeNotifierProxyProvider<ProductModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}