import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_for_friends/models/Product.dart';
import 'package:shopping_for_friends/models/user.dart';

import 'database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final db = Firestore.instance;

  User currentUser = User();

  // create user obj based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
      userUpdateInfo.displayName = name;
      user.updateProfile(userUpdateInfo);
      await DatabaseService(uid: user.uid).updateUserData(name);
      /*currentUser = User(
        email: user.email,
        name: user.displayName,
      );
      await db
          .collection('users')
          .document(user.email)
          .setData(currentUser.toMap());*/
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<void> addUserToFirestore({FirebaseUser user}) async {
    // add user to firestore, email as document ID
    currentUser = User(
      email: user.email,
      name: user.displayName,
    );
    await db
        .collection('users')
        .document(user.email)
        .setData(currentUser.toMap());
  }

  // Add given list to firebase database
  Future<void> addListToFirestore(User usuario) async {
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    usuario.myList.add(Product());
    usuario.myList.add(Product());
    usuario.myList.add(Product());
    await db
        .collection('lists')
        .document(uid)
        .updateData({'lista': usuario.myList.map((i) => i.toJson()).toList()});
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
