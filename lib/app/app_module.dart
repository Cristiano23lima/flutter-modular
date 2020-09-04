import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/app_controller.dart';
import 'package:pokemon/app/app_widget.dart';
import 'package:pokemon/app/pages/home/home_controller.dart';
import 'package:pokemon/app/pages/home/home_page.dart';
import 'package:pokemon/app/shared/repositories/poke_repository.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
    Bind((i) => AppController()),
    Bind((i) => HomeController()),
    Bind((i) => PokeRepository(i.get())),
    Bind((i) => Dio()),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (_, args) => HomePage())
  ];

  @override
  Widget get bootstrap => AppWidget();
}
