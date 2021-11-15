import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  NewsCard({@required this.item});
  var item;

  @override
  Widget build(BuildContext context) {
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
