import 'package:flutter/material.dart';

class InfoComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
      child: Card(
          child: ListTile(
        title: Text(
          "AgroUP",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700,color: Colors.grey),
        ),
      )),
    );
  }
}
