import 'package:flutter/material.dart';

class InfoComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
      child: Column(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(),
            margin:EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ListTile(
                title: Text(
                  "AgroUP",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700,color: Colors.grey),
                ),
                subtitle: Text(' AgroUp é uma StartUp voltada para o agronegocio, utilizamos predições com algoritmos de inteligencia artificial e Redes Neurais para solucionar problemas do campo.',
                    style: TextStyle(fontSize:20,fontWeight: FontWeight.w300, ),
                  ),
                 ),
                 SizedBox(height: 5,),
                 Text("Seja sempre determinado"),
              ],
            )),
        ],
      ),
    );
  }
}
