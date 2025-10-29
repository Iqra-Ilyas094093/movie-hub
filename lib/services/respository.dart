import 'package:movie_hub/model/case_details_model.dart';
import 'package:movie_hub/model/movie_details_model.dart';
import 'package:movie_hub/model/popular_movie_model.dart';
import 'package:movie_hub/model/ratingData_model.dart';
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
  Future<MovieDetailsModel> getMovieDetails(int id)async{
    return await apiServices.movieDeaitlsData(id);
  }
  Future<RatingOmdbModel> getRating(String imdbId)async{
    return await apiServices.ratingData(imdbId);
  }
  Future<CastModel> getCast(int id)async{
    return await apiServices.castData(id);
  }
}