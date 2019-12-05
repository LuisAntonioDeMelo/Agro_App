import 'package:agro_app/shared/models/Noticia.dart';
import 'package:flutter/material.dart';

class NoticiaPage extends StatefulWidget {
 final Noticia noticia;
 const NoticiaPage(this.noticia);
 

  @override
  NoticiaPageState createState() => NoticiaPageState();
}

class NoticiaPageState extends State<NoticiaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.lightGreen),
        body: Container(
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
        child: Card(
            child: ListTile(
              leading: Image(image: AssetImage(widget.noticia.imagemUrl),),
          title: Text(widget.noticia.titulo,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w700, color: Colors.grey),
          ),
        )),
      ),
    );
  }
}

