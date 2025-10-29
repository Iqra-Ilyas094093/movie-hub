
import 'package:flutter/widgets.dart';
import 'package:movie_hub/Utils/enum.dart';
import 'package:movie_hub/model/popular_movie_model.dart';
import 'package:movie_hub/model/upcoming_movies_model.dart';
import 'package:movie_hub/services/respository.dart';

class PopularMoviesProvider extends ChangeNotifier{
  MovieRepository repository = MovieRepository();
  String? ErrorMessage;
  apiState _state = apiState.initial;
  apiState get state =>_state;
  PopularMoviesModel? popularMoviesModel;


  Future<void> getPopularMoviesData()async{
    _state = apiState.loading;
    notifyListeners();

    try{
      popularMoviesModel = await repository.getPopularMovies();
      _state = apiState.loaded;
    }catch(e){
      _state = apiState.error;
      ErrorMessage = e.toString();
    }
    notifyListeners();
  }
}