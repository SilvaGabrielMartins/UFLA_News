import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../components/newsCard.dart';

class NewsPage extends StatefulWidget {
  var news;
  NewsPage(this.news);

  @override
  _NewsPageState createState() => new _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("UFLA News")),
        body: SingleChildScrollView(
            child: Card(
                elevation: 4,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                color: Colors.white,
                child: Center(
                    child: Column(children: <Widget>[
                  Container(
                    width: 480,
                    height: 130,
                    child: Image.network(
                      "${widget.news['Capa']}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(children: <Widget>[
                        Text("${widget.news['Titulo']}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        Text("${widget.news['Autor']}",
                            textAlign: TextAlign.center),
                        Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            child: Text("${widget.news['Conteudo']}",
                                textAlign: TextAlign.justify,
                                style: const TextStyle(fontSize: 16)))
                      ]))
                ])))));
  }
}
