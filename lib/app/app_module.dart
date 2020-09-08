import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/app_controller.dart';
import 'package:pokemon/app/app_widget.dart';
import 'package:pokemon/app/modules/home/home_module.dart';
import 'package:pokemon/app/shared/utils/constants.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
    Bind((i) => AppController()),
    Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, module: HomeModule())
  ];

  @override
  Widget get bootstrap => AppWidget();
}
