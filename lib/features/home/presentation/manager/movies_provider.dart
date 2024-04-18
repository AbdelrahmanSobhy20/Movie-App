import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:movie_app_indvidual/features/home/data/repo/home_repo.dart';

import '../../data/models/movie_model.dart';

class MoviesProvider extends ChangeNotifier {
  List<MovieModel>? _movies;

  List<MovieModel>? get movies => _movies;

  set movies(List<MovieModel>? value) {
    _movies = value;
    notifyListeners();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
  }

  Future <void> fetchMovies(BuildContext context) async {
    isLoading = true;
    try {
      movies = await HomeRepo().getMovies();
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
