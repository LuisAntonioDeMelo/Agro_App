import 'package:agro_app/screens/screens.predicoes/detalhes-predicao.dart';
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
                predictContainer(context,
                  new Dados.fill(
                    'Cercospora Sojina',
                    'Popurlamente conhecida como Olho de Rã ',
                    'Soja',
                    'imagens/soja6.jpg',
                    '94%',
                    'Considerada uma praga da cultura de soja, o fungo causa a doença conhecida com olho-de-rã e foi identificado no Brasil na década de 70 e desde então disseminou-se por todo o país. O patógeno tem a capacidade de desenvolver novas raças com muita facilidade. Somente no Brasil, são conhecidas mais de 20 raças. Sobrevive por algum tempo sobre restos culturais no campo, principalmente nas hastes, ou ainda, com maior frequência em sementes. O desenvolvimento da doença vai depender de alguns fatores, tais como chuvas frequentes, formação de orvalho, temperaturas durante a noite acima de 20 °C e a existência de inóculo do fungo na área. A disseminação no campo ocorre por meio de sementes infectadas ou contaminadas superficialmente e também por meio de restos culturais. A longas distâncias, as sementes são a principal forma de disseminação')
                    ),
                predictContainer(context,
                new Dados.fill(
                  'Lagarta do cartucho',
                  'Lagarta militar (Spodoptera frugiperda)'
                  ,'Soja',
                  'imagens/soja4.jpg',
                  '91%',
                  "Danos: Esta espécie ataca preferencialmente o cartucho, mas também podem ser encontradas atacando plântulas, com hábito semelhante ao da lagarta rosca, espigas e, também, perfurando a base da planta, atingindo o ponto de crescimento e provocando o sintoma de coração morto, típico da elasmo"
                  +"Controle: Tratamento de sementes, para controle nas fases iniciais da cultura, e aplicação de inseticidas sistêmicos, que controlam bem a praga quando as condições de suprimento de água são satisfatórias. Em condições de déficit hídrico, os tratamentos anteriores devem ser suplementados com pulverizações direcionadas para a região do cartucho. Recomenda-se o uso de produtos registrados para as culturas."),
                  ),
                //predictContainer(context,new Dados.fill('','','','imagens/soja3.jpg','88%')),
              ],
            )),
      ),
    );
  }
}

Widget predictContainer(BuildContext context,Dados dados) {
  return Column(
    children: <Widget>[
      Container(
      height: 80.0,
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: new Stack(
        children: <Widget>[
          predictCard(context,dados), 
          thumbPredict(dados.acuracia)],
      ),
    ),
    ],
  );
}

Widget thumbPredict(String acuracia) => new Container(
  margin: EdgeInsets.symmetric(
    vertical: 15.0,
  ),
  alignment: FractionalOffset.centerRight,
  child: CircleAvatar(
    backgroundColor: Colors.green,
    maxRadius: 25,
    child: Center(child: Text(acuracia)),
  ),
);

Widget predictCard(BuildContext context,Dados dados) => MaterialButton(
  child:   Container(
        height: 130.0,
        margin: new EdgeInsets.only(right: 25.0),
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
      ), onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Detalhe(dados)));
      },
);
