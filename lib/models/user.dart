import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_for_friends/models/Product.dart';

class User {
  final String uid;
  final String name;
  final String email;
  List<Product> myList;

  User({this.uid, this.name, this.email});

  void addProductToList(Product p,int quantity) {
    p.quantity=quantity;
    myList.add(p);
  }

  void removeProductfromList(Product p) {
    myList.remove(p);
  }

  Map<String, dynamic> toMap() {
     List<Map> lista =
        this.myList != null ? this.myList.map((i) => i.toJson()).toList() : null;
    return {'email': email, 'name': name, 'uid': uid,'lista':lista};
  }

  User.fromMap(Map<String, dynamic> map)
      : assert(map['email'] != null),
        assert(map['name'] != null),
        assert(map['uid'] != null),
        email = map['email'],
        name = map['name'],
        uid = map['uid'];

  User.fromSnapshot(DocumentSnapshot snapshot) : this.fromMap(snapshot.data);
}
