import 'package:agro_app/screens/screens.home/noticia.dart';
import 'package:agro_app/shared/models/Noticia.dart';
import 'package:agro_app/shared/models/Predicao.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeConteudo extends StatefulWidget {
  @override
  _HomeConteudoState createState() => _HomeConteudoState();
}

class _HomeConteudoState extends State<HomeConteudo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //predições realizadas
              Container(
                width: MediaQuery.of(context).size.width / 0.5,
                height: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.insert_chart),
                        title: Text(
                          "Quantidade de predições realizadas",
                          style: TextStyle(color: Colors.black38),
                        ),
                      ),
                      //Wiget de gráficos
                      new GraficoContainer(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width / 20),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.calendar_today),
                        title: Text('Últimas Notícias'),
                      ),
                      noticiaRow(
                          context,
                          new Noticia.fill(
                              'Exportações do agronegócio são recordes mas faturamento cai',
                              'descricao',
                              'imagens/news1.jpg',
                              'texto')),
                      SizedBox(height: 5),
                       noticiaRow(
                          context,
                          new Noticia.fill(
                              'Como a Inteligência Artificial vai transformar o agronegócio',
                              'descricao',
                              'imagens/imgs.jpg',
                              'texto')),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget noticiaRow(BuildContext context, Noticia noticia) => MaterialButton(
      child: Card(
        elevation: 0,
        child: ListTile(
          leading: CircleAvatar(
            maxRadius: 30,
            backgroundImage: AssetImage(noticia.imagemUrl),
          ),
          title: Text(noticia.titulo),
        ),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NoticiaPage(noticia)));
      },
    );

class GraficoContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.1,
        height: MediaQuery.of(context).size.height / 2.8,
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            legend: Legend(isVisible: true),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <LineSeries<Predicao, String>>[
              LineSeries<Predicao, String>(
                  dataSource: [
                    Predicao('Jan', 455),
                    Predicao('Fev', 31),
                    Predicao('Mar', 45),
                    Predicao('Mai', 2),
                    Predicao('Jun', 31),
                    Predicao('Jul', 314),
                    Predicao('Ago', 313),
                    Predicao('Set', 12),
                    Predicao('Out', 400),
                    Predicao('Nov', 425),
                    Predicao('Dec', 23)
                  ],
                  xValueMapper: (Predicao predic, _) => predic.mes,
                  yValueMapper: (Predicao predic, _) => predic.quantidade)
            ]),
      ),
    );
  }
}
