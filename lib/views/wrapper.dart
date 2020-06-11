import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_for_friends/models/Product.dart';
import 'package:shopping_for_friends/models/user.dart';

import 'authentication/authenticate.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ProductModel>(context, listen: false).getProducts();
    final user = Provider.of<User>(context);
    print(user);
   /*  print(user.myList); */

    // return either the Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
