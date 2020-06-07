import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_for_friends/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference users = Firestore.instance.collection('users');

  Future<void> updateUserData(String name) async {
    return await users.document(uid).setData({
      'name': name,
    });
  }

  // user data from snapshots
  User _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return User(
        uid: uid,
        name: snapshot.data['name'],
    );
  }

  // get user doc stream
  Stream<User> get userData {
    return users.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }

}