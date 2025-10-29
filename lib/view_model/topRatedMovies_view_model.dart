import 'package:flutter/material.dart';
import 'package:movie_hub/Utils/enum.dart';
import 'package:movie_hub/model/top_rated_movies_model.dart';
import 'package:movie_hub/services/respository.dart';

class topRatedMoviesProvider extends ChangeNotifier{
  MovieRepository _repo = MovieRepository();
  apiState _state = apiState.initial;
  apiState get state =>_state;
  String? errorMessage;
  TopRatedMoviesModel? topRatedMovies;
  Future<void> getTopRatedData()async{
    _state = apiState.loading;
    notifyListeners();
    try{
      topRatedMovies = await _repo.getTopRatedMovies();
      _state = apiState.loaded;
    }catch(e){
      _state = apiState.error;
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}