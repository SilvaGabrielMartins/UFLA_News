/*
Aplicativo UFLA News desenvolvido utilizando Flutter como trabalho da disciplina GCC 144 - Desenvolvimento de aplicativos mobile
Grupo: 
Gabriel Martins Silva
Lucas de Carvalho Felizardo 
UFLA 2021
*/
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'pages/feedPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UFLA News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xEEEEEEEE),
      ),
      home: FeedPage(),
    );
  }
}
