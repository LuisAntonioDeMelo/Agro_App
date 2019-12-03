import 'package:agro_app/shared/models/Dados.dart';
import 'package:flutter/material.dart';

class PredicoesWidget extends StatefulWidget {
  @override
  _PredicoesWidgetState createState() => _PredicoesWidgetState();
}

class _PredicoesWidgetState extends State<PredicoesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: <Widget>[
                predictContainer(new Dados()),
                predictContainer(new Dados()),
                predictContainer(new Dados()),
              ],
            )),
      ),
    );
  }
}

Container predictContainer(Dados dados) {
  return (Container(
    height: 90.0,
    margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
    child: new Stack(
      children: <Widget>[predictCard(dados), thumbPredict],
    ),
  ));
}

final thumbPredict = new Container(
  margin: EdgeInsets.symmetric(
    vertical: 15.0,
  ),
  alignment: FractionalOffset.centerRight,
  child: CircleAvatar(
    backgroundColor: Colors.green,
    maxRadius: 25,
    child: Center(child: Text("95%")),
  ),
);

Widget predictCard(Dados dados) => Container(
      height: 130.0,
      margin: new EdgeInsets.only(right: 30.0),
      child: Card(
        elevation: 0,
        child: ListTile(
          leading: ClipRect(
            child: Image(
              image: AssetImage(dados.imagemUrl),
              fit: BoxFit.cover,
            ),
          ),
          title: Text(dados.titulo),
          subtitle: Text(dados.descricao),
        ),
      ),
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );
