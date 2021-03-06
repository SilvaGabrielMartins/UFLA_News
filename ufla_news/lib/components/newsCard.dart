import 'package:flutter/material.dart';
import 'package:ufla_news/models/newsModel.dart';
import 'package:ufla_news/pages/newsPage.dart';

class NewsCard extends StatelessWidget {
  NewsCard({@required this.news});
  NewsModel news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewsPage(news)));
        },
        child: Card(
            elevation: 4,
            clipBehavior: Clip.antiAlias,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Colors.white,
            child: Center(
                child: Column(children: <Widget>[
              Container(
                width: 480,
                height: 130,
                child: Image.network(
                  "${news.capa}",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(children: <Widget>[
                    Text("${news.titulo}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Text("${news.autor}", textAlign: TextAlign.center)
                  ]))
            ]))));
  }
}
