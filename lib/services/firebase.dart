import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_for_friends/models/Product.dart';
import 'package:shopping_for_friends/models/friend.dart';
import 'package:shopping_for_friends/models/user.dart';

import 'database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
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
      final DocumentSnapshot userSnapshot =
          await db.collection('users').document(user.uid).get();
      updateCurrentSignedInUser(user, userSnapshot);
      getFriendsList();
      print(currentUser.getFriendsList());
      return currentUser;
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
      currentUser = User(email: email, name: name, uid: user.uid);
      await db
          .collection('users')
          .document(user.uid)
          .setData(currentUser.toMap());
      await getFriendsList();
      return currentUser;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  void updateCurrentSignedInUser(
      FirebaseUser user, DocumentSnapshot userSnapshot) {
    print("updating email");
    currentUser = User.fromMap(userSnapshot.documentID, userSnapshot.data);
  }

  getCollection() {
    return this.db.collection("users").snapshots();
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
  Future<void> addListToFirestore(List<Product> items, int total) async {
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;

    await db
        .collection('lists')
        .document(uid)
        .setData({'lista': items.map((i) => i.toJson()).toList(),
                  'total': total});
    
  }

  Future<void> getMyList() async {
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    this.db.collection("lists").document(uid).get().then((DocumentSnapshot ds) {
      print(ds.data);
      return ds;
    });
  }
  Future<void> getLists() async {
   
    this.db.collection("lists")
      .getDocuments()
      .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((f) => print('${f.data}}'));
  });
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

  getFriendsList() async {
    List<Friend> friends = new List();
    QuerySnapshot querySnapshot =
        await this.db.collection('users').getDocuments();
    var lista = querySnapshot.documents;
    lista.forEach((document) => {
          this.currentUser.addFriend(
              new Friend(document.documentID, document.data['name'], null))
        });
    return friends;
  }

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    // check if user already exists
    final DocumentSnapshot userSnapshot =
        await db.collection('users').document(user.uid).get();
    if (userSnapshot.exists) {
      // user exists, retrieve user data from firestore
      //this.currentUser = User.fromMap(user.uid, userSnapshot.data);
      //updateCurrentSignedInUser(user, userSnapshot);
    } else {
      // user not exists, create a new user
      await addUserToFirestore(user: user);
    }
    print('signInWithGoogle succeeded: $user');
    return 'signInWithGoogle succeeded: $user';
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();
    print("User Sign Out");
  }
}
