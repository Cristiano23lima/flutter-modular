import 'package:dio/dio.dart';
import 'package:pokemon/app/shared/models/pokemon_model.dart';

class PokeRepository {
  final Dio dio;

  PokeRepository(this.dio);

  Future<List<PokemonModel>> getAllPokemons() async {
    dio.get('');
  }
}
