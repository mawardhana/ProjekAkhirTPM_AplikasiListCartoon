import 'package:flutter/material.dart';
import 'package:projekakhir_pemrogramanmobile/pages/homepage.dart';
import 'package:projekakhir_pemrogramanmobile/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // title: 'Projek Akhir',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: LoginPage(),
    );
  }
}
