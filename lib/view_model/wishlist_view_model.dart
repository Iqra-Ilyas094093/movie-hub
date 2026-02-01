import 'package:flutter/cupertino.dart';
import 'package:movie_hub/Utils/enum.dart';
import 'package:movie_hub/model/single_movie_id_search.dart';
import 'package:movie_hub/services/respository.dart';

class WishListProvider extends ChangeNotifier{
  List<int> movieIds = [];
  MovieRepository repository = MovieRepository();
  apiState _state = apiState.initial;
  apiState get state => _state;
  String? errorMessage;
  List<SingleMovieIdSearch> _movies = [];
  List<SingleMovieIdSearch> get movies => _movies;


  void toggleMovie(int id){
    if(movieIds.contains(id)){
      movieIds.remove(id);
      _movies.removeWhere((movie) => movie.id == id);
    }else{
      movieIds.add(id);
      loadMovie(id);
    }
    notifyListeners();
  }

  Future<void> loadMovie(int id)async{
    try{
      final movie = await repository.searchbyId(id);
      _movies.add(movie);
      notifyListeners();
    }catch (e){
      throw Exception('failed to load movie with id $id');
    }
  }

  Future<void> loadAllMovies()async{
    _state = apiState.loading;
    notifyListeners();

    _movies = [];
    try{
      _state = apiState.loaded;
      for(var id in movieIds){
        final movie = await repository.searchbyId(id);
        _movies.add(movie);
      }
    }catch(e){
      _state = apiState.error;
      throw Exception('failed to load all movies to wishlist');
    }
    notifyListeners();
  }
}