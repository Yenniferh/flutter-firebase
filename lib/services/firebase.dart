import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future createAccount(String email, String pass) async {
  final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
    email: email,
    password: pass,
  ))
      .user;
  return user;
}
