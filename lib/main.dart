import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secret/reciepe.dart';
import 'package:secret/reciepeListScreen.dart';
import 'package:secret/reciepeScreen.dart';
import 'package:transparent_image/transparent_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dji App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ReciepeListScreen(),
    );
  }
}

