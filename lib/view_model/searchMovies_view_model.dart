import 'package:flutter/cupertino.dart';
import 'package:movie_hub/Utils/enum.dart';
import 'package:movie_hub/model/search_result_model.dart';
import 'package:movie_hub/services/respository.dart';


class SearchMoviesProvider extends ChangeNotifier{
  MovieRepository repository = MovieRepository();
  String? errorMessage;
  SearchResultModel? searchResultModel;
  apiState _state = apiState.initial;
  apiState get state =>_state;

  Future<void>  getSearchResults(String query)async{
    _state = apiState.loading;
    notifyListeners();

    try{
      searchResultModel = await repository.searchMovies(query);
      _state = apiState.loaded;
    }catch(e){
      _state = apiState.error;
      errorMessage = e.toString();
      throw Exception(e.toString());
    }
    notifyListeners();
  }
}