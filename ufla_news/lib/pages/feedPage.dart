import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ufla_news/models/newsModel.dart';
import '../components/newsCard.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Coleção das notícias
    var snapshots = Firestore.instance.collection('noticias').snapshots();
    return Scaffold(
      appBar: AppBar(title: Text("UFLA News")),
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
              return Center(child: Text('Nenhuma notícia cadastrada'));
            }
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int i) {
                  var item = snapshot.data.documents[i].data;
                  return NewsCard(
                      news: NewsModel(
                          titulo: item['Titulo'],
                          autor: item['Autor'],
                          capa: item['Capa'],
                          conteudo: item['Conteudo']));
                });
          }),
    );
  }
}
