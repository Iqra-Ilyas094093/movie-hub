import 'package:flutter/cupertino.dart';
import 'package:movie_hub/Utils/enum.dart';
import 'package:movie_hub/model/movie_details_model.dart';
import 'package:movie_hub/model/ratingData_model.dart';
import 'package:movie_hub/services/respository.dart';

import '../model/case_details_model.dart';

class MovieDetailsProvider extends ChangeNotifier {
  MovieRepository repository = MovieRepository();
  apiState _state = apiState.initial;
  int _selectedTabIndex = 0;

  int get selectedTabIndex => _selectedTabIndex;
  apiState get state => _state;
  MovieDetailsModel? movieDetailsModel;
  RatingOmdbModel? ratingOmdbModel;
  CastModel? castModel;
  String? ErrorMessage;

  void setTabIndex(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  Future<void> fetchMovieDetails(int id) async {
    _state = apiState.loading;
    notifyListeners();

    try {
      debugPrint("🎬 Fetching movie details...");
      movieDetailsModel = await repository.getMovieDetails(id);
      debugPrint("✅ Movie details fetched: ${movieDetailsModel != null}");
      debugPrint("🆔 imdbId: ${movieDetailsModel?.imdbId}");

      if (movieDetailsModel != null && movieDetailsModel!.imdbId != null) {
        debugPrint("🍅 Fetching rating data...");
        ratingOmdbModel = await repository.getRating(movieDetailsModel!.imdbId);
        debugPrint("✅ Rating data fetched: ${ratingOmdbModel != null}");
      } else {
        debugPrint("⚠️ imdbId is null or movieDetailsModel is null");
      }

      debugPrint("👥 Fetching cast...");
      castModel = await repository.getCast(id);
      debugPrint("✅ Cast data fetched: ${castModel != null}");

      _state = apiState.loaded;
    } catch (e, s) {
      ErrorMessage = e.toString();
      debugPrint("❌ Error in fetchMovieDetails: $ErrorMessage");
      debugPrintStack(stackTrace: s);
      _state = apiState.error;
    }

    notifyListeners();
  }


}
