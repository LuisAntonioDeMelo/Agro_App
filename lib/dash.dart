import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Dash')),
            backgroundColor: Colors.teal
          ),
          body: Text('sd'),
        ),
    );
  }
}