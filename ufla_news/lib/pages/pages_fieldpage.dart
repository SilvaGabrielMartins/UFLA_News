import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ufla_news/pages/pages_searchpage.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Coleção das notícias
    var snapshots = Firestore.instance.collection('noticias').snapshots();
    return Scaffold(
      appBar: AppBar(
        title: Text("UFLA News"),
        actions: [
          // Navigate to the Search Screen
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SearchPage())),
              icon: Icon(Icons.search))
        ],
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
                  print(item["Capa"]);
                  return buildCard(item);
                });
          }),
    );
  }

  Widget buildCard(var item) {
    return Card(
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Colors.white,
        child: Center(
            child: Column(children: <Widget>[
          Container(
            width: 480,
            height: 130,
            child: Image.network(
              "${item['Capa']}",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: Column(children: <Widget>[
                Text("${item['Titulo']}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
                Text("${item['Autor']}", textAlign: TextAlign.center)
              ]))
        ])));
  }
}
