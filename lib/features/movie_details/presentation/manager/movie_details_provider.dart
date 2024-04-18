import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:movie_app_indvidual/features/movie_details/data/models/movie_model_details.dart';

import '../../data/repo/details_repo.dart';

class MovieDetailsProvider extends ChangeNotifier{
  MovieModelDetails? _movies;

  MovieModelDetails? get movies => _movies;

  set movies(MovieModelDetails? value) {
    _movies = value;
    notifyListeners();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
  }

  Future <void> fetchMovies(BuildContext context , String id) async {
    isLoading = true;
    try {
      movies = await DetailsRepo().getMovies(id);
      isLoading = false;
    } catch (e) {
      isLoading = false;
      SchedulerBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Field to fetch movies")),
        );
      });
    }
  }
}