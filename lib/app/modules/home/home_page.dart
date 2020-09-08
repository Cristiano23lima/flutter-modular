import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pokemon/app/modules/home/home_controller.dart';

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
      body: Observer(builder: (_) {
        if (homeController.pokemons.error != null &&
            (homeController.pokemons.status != FutureStatus.pending)) {
          return Center(
            child: RaisedButton(
              child: Text('Press again'),
              onPressed: () {
                homeController.fetchPokemons();
              },
            ),
          );
        }

        if (homeController.pokemons.status == FutureStatus.pending) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        var list = homeController.pokemons.value;

        return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(list[index].name),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            // Navigator.pushNamed(context, '/other/${homeController.text}');
            Modular.to.pushNamed('/other');
          }),
    );
  }
}
