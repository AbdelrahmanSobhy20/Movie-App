import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app_indvidual/features/home/data/models/movie_model.dart';

class HomeRepo {
  static const String endPoint = "https://imdb-top-100-movies.p.rapidapi.com/";
  Future<List<MovieModel>> getMovies() async {
    final headers = {
      'X-RapidAPI-Key': '6b8f0bf273msh3b286188862d850p10f54bjsn8d79159cd79a',
      'X-RapidAPI-Host': 'imdb-top-100-movies.p.rapidapi.com'
    };
    final response = await http.get(Uri.parse(endPoint), headers: headers);
    if (response.statusCode <= 299 && response.statusCode >= 200) {
      final List<dynamic> decodedResponse = jsonDecode(response.body);
      List<MovieModel> movies =
          decodedResponse.map((item) => MovieModel.fromJson(item)).toList();
      print(response.statusCode);
      return movies;
    } else {
      print(response.statusCode);
      throw ("RequestFailure${response.body}");
    }
  }
}
