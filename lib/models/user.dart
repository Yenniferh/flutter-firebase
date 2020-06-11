import 'package:shopping_for_friends/models/Product.dart';
import 'package:shopping_for_friends/models/friend.dart';

class User {
  final String uid;
  final String name;
  final String email;
  List<Product> myList;
  List<Friend> myFriendsList = new List();

  User({this.uid, this.name, this.email});

  void addFriend(Friend friend) {
    myFriendsList.add(friend);
  }

  Friend getFriend(int index){
    return myFriendsList[index];
  }

  List<Friend> getFriendsList(){
    return myFriendsList;
  }

  void addProductToList(Product p,int quantity) {
    p.quantity=quantity;
    myList.add(p);
  }

  void removeProductfromList(Product p) {
    myList.remove(p);
  }

  Map<String, dynamic> toMap() {
    return {'email': email, 'name': name};
  }

  factory User.fromMap(String uid, Map<String, dynamic> map) {
    assert(uid != null);
    assert(map != null);
    return User(
      email: map['email'],
      name: map['name'],
      uid: uid,
    );
  }
}
