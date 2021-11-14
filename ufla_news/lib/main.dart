import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'pages/pages_fieldpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Recupera a coleção noticias do banco do Fire Store
    Firestore.instance.collection('noticias').getDocuments().then((value) {
      value.documents.forEach((elemento) {
        print(elemento.data);
      });
    });
    return MaterialApp(
      title: 'UFLA News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xEEEEEEEE),
      ),
      home: MyHomePage(),
    );
  }
}
