import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app_indvidual/features/movie_details/data/models/movie_model_details.dart';

class DetailsRepo {
  Future<MovieModelDetails> getMovies(String id) async {
    final headers = {
      'X-RapidAPI-Key': '6b8f0bf273msh3b286188862d850p10f54bjsn8d79159cd79a',
      'X-RapidAPI-Host': 'imdb-top-100-movies.p.rapidapi.com'
    };
    final response = await http.get(
        Uri.parse("https://imdb-top-100-movies.p.rapidapi.com/$id"),
        headers: headers);
    if (response.statusCode <= 299 && response.statusCode >= 200) {
      final decodedResponse = jsonDecode(response.body);
      print(decodedResponse);
      MovieModelDetails movieModelDetails = MovieModelDetails.fromJson(decodedResponse);
      return movieModelDetails;
    } else {
      print(response.statusCode);
      throw ("RequestFailure${response.body}");
    }
  }
}
