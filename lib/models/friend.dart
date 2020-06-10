import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_for_friends/models/Product.dart';

class Friend {
  final String uid;
  final String name;
  final int price;


  Friend(this.uid, this.name, this.price);

  //Friend({this.uid, this.name});
}
