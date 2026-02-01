import 'package:flutter/material.dart';
import 'package:movie_hub/Utils/enum.dart';
import 'package:movie_hub/model/upcoming_movies_model.dart';
import 'package:movie_hub/services/respository.dart';

class UpcomingMoviesProvider extends ChangeNotifier{
  MovieRepository repository = MovieRepository();
  apiState _state = apiState.initial;
  apiState get state =>_state;
  String? ErrorMessage;
  UpcomingMoviesModel? upcomingMoviesModel;
  Future<void> getUpcomingMoviesData()async{
    _state = apiState.loading;
    notifyListeners();
    try{
      upcomingMoviesModel = await repository.getUpcomingMovies();
      _state = apiState.loaded;
    }catch(e,stackTrace){
      ErrorMessage = e.toString();
      _state = apiState.error;
      throw Exception('${e.toString()} ${stackTrace}');
    }
    notifyListeners();
  }
}