import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/pages/home/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final homeController = Modular.get<HomeController>();
   return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: TextField(
          onChanged: (value) {
            homeController.text = value;
          },
          decoration: InputDecoration(labelText: 'Um texto qualquer'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            // Navigator.pushNamed(context, '/other/${homeController.text}');
            Modular.to.pushNamed('/other');
          }),
    );
  }
}