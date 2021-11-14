import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Coleção das notícias
    var snapshots = Firestore.instance.collection('noticias').snapshots();
    return Scaffold(
      appBar: AppBar(
        title: Text("UFLA News"),
      ),
      body: StreamBuilder(
          stream: snapshots,
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,
          ) {
            // Verifica possiveis erros e retorna a mensagem para o usuario
            if (snapshot.hasError) {
              return Center(child: Text('Erro: ${snapshot.error}'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.data.documents.length == 0) {
              return Center(child: Text('Nenhum produto cadastrado'));
            }
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int i) {
                  var item = snapshot.data.documents[i].data;
                  return Card(
                    color: Colors.blue[700],
                    child: Center(
                      child: Text(
                        "${item['Titulo']}",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
