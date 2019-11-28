import 'package:flutter/material.dart';

class PredicoesWidget extends StatefulWidget {
  PredicoesWidget({Key key}) : super(key: key);

  @override
  _PredicoesWidgetState createState() => _PredicoesWidgetState();
}

class _PredicoesWidgetState extends State<PredicoesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: <Widget>[
              PredicaoWidget(context, 'Predict', 'imagens/news1.jpg', 85),
              SizedBox(
                height: 10,
              ),
              PredicaoWidget(context, 'Predict', 'imagens/news1.jpg', 85),
              SizedBox(
                height: 10,
              ),
              PredicaoWidget(context, 'Predict', 'imagens/news1.jpg', 85),
              SizedBox(
                height: 10,
              ),
              PredicaoWidget(context, 'Predict', 'imagens/news1.jpg', 85),
            ],
          )),
    );
  }
}

Widget PredicaoWidget(BuildContext context, String titulo, String imagemNoticia,
        int idNoticia) =>
    MaterialButton(
      child: Card(
        elevation: 1,
        child: ListTile(
          leading: CircleAvatar(
            maxRadius: 35,
            backgroundImage: AssetImage(imagemNoticia),
          ),
          title: Text(titulo),
        ),
      ),
      onPressed: () {
        print('tap noticia');
      },
    );
