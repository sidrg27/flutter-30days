import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  var name = "sid";
  int days = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("day 1=1"),
      ),
      body: Container(
        child: Center(child: Text("Welcome ${name}  to $days days of flutter")),
      ),
      drawer: Drawer(),
    );
  }
}
