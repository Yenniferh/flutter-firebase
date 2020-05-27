import 'package:flutter/material.dart';
import 'services/firebase.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    createAccount("hyennifera@gmail.com", "perro123456");
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Shopping for friends'),
      ),
      body: Container(
        child: Text('hola'),
      ),
    );
  }
}
