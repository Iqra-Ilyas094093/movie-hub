import 'package:flutter/cupertino.dart';
import 'package:movie_hub/Utils/enum.dart';
import 'package:movie_hub/model/case_details_model.dart';
import 'package:movie_hub/model/single_movie_id_search.dart';
import 'package:movie_hub/services/respository.dart';

class SearchMovieByIdProvider extends ChangeNotifier{
  MovieRepository repository;
  SearchMovieByIdProvider({required this.repository});
  String? errorMessage;
  apiState _state = apiState.initial;
  apiState get state =>_state;
  SingleMovieIdSearch? singleMovieIdSearch;
  CreditsModel? creditsModel;

  Future<void> getSingleMovieDataById(int id)async{
    _state = apiState.loading;
    notifyListeners();
    try{
      singleMovieIdSearch = await repository.searchbyId(id);
      creditsModel = await repository.getCreditsData(id);
      creditsModel ??= CreditsModel(cast: [], crew: [],id: id);
      creditsModel!.cast ??= [];
      creditsModel!.crew ??= [];
      _state = apiState.loaded;
    }catch(e,stackTrace){
      _state = apiState.error;
      print('${e.toString()} ${stackTrace}');
      throw Exception('failed to get movie search data in view model');
    }
    notifyListeners();
  }

}