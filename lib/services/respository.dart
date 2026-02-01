import 'package:movie_hub/model/case_details_model.dart';
import 'package:movie_hub/model/movie_details_model.dart';
import 'package:movie_hub/model/popular_movie_model.dart';
import 'package:movie_hub/model/ratingData_model.dart';
import 'package:movie_hub/model/search_result_model.dart';
import 'package:movie_hub/model/single_movie_id_search.dart';
import 'package:movie_hub/model/top_rated_movies_model.dart';
import 'package:movie_hub/services/api_services.dart';

import '../model/upcoming_movies_model.dart';

class MovieRepository{
  ApiServices apiServices = ApiServices();
  Future<TopRatedMoviesModel> getTopRatedMovies()async{
    return await apiServices.topRatedMoviesData();
  }
  Future<UpcomingMoviesModel> getUpcomingMovies()async{
    return await apiServices.upcomingMoviesData();
  }
  Future<PopularMoviesModel> getPopularMovies()async{
    return await apiServices.popularMoviesData();
  }
  Future<RatingOmdbModel> getRating(String imdbId)async{
    return await apiServices.ratingData(imdbId);
  }
  Future<CreditsModel> getCreditsData(int id)async{
    return await apiServices.creditsData(id);
  }
  Future<SearchResultModel> searchMovies(String query)async{
    return await apiServices.searchMoviesData(query);
  }
  Future<SingleMovieIdSearch> searchbyId(int id)async{
    return await apiServices.searchbyId(id);
  }
}