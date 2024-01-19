import 'package:dio_api/screens/administrative/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Administrative App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AdministrativeIndex(),
    );
  }
}
