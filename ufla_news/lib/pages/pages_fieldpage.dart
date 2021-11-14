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
                  return Card(
                    elevation: 2,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: Colors.blue[700],
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            width: 480,
                            height: 200,
                            child: Image.network(
                              "${item['Capa']}",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              "${item['Titulo']}",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text(
                            "${item['Autor']}",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
