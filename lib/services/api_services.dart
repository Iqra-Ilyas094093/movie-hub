import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_hub/Utils/Urls.dart';
import 'package:movie_hub/model/case_details_model.dart';
import 'package:movie_hub/model/popular_movie_model.dart';
import 'package:movie_hub/model/ratingData_model.dart';
import 'package:movie_hub/model/search_result_model.dart';
import 'package:movie_hub/model/single_movie_id_search.dart';
import 'package:movie_hub/model/top_rated_movies_model.dart';
import 'package:movie_hub/model/upcoming_movies_model.dart';

class ApiServices{
  Future<TopRatedMoviesModel> topRatedMoviesData()async{
    final url = '${AppUrl.base_url}${AppUrl.topRatedMoviesEndpoint}${AppUrl.key}';
    print(url);
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      print('success');
      print(response.statusCode);
      final data = jsonDecode(response.body);
      print(data);
      return TopRatedMoviesModel.fromJson(data);
    }else{
      throw Exception('unable to fetch data from api');
    }

  }

  Future<SearchResultModel> searchMoviesData(String query)async{
    final url = '${AppUrl.base_url}${AppUrl.searchMoviesEndpoint}${AppUrl.key}&query=$query';
    print(url);
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      print('success');
      print(response.statusCode);
      final data = jsonDecode(response.body);
      return SearchResultModel.fromJson(data);
    }else{
      throw Exception('unable to fetch search result data');
    }
  }

  Future<SingleMovieIdSearch> searchbyId(int id)async{
    final url = '${AppUrl.base_url}/movie/$id${AppUrl.key}';
    print(url);
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      print('success');
      final data = jsonDecode(response.body);
      return SingleMovieIdSearch.fromJson(data);
    }
    else{
      throw Exception('unable to fetch search result data for single movie by id');
    }

  }

  Future<UpcomingMoviesModel> upcomingMoviesData()async{
    final url = '${AppUrl.base_url}${AppUrl.upcomingMoviesEndpoint}${AppUrl.key}';
    print(url);
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      print(data);
      return UpcomingMoviesModel.fromJson(data);
    }
    else{
      throw Exception('failed to fetch upcoming movies data with status code ${response.statusCode}');
    }
  }

  Future<PopularMoviesModel> popularMoviesData()async{
    final url = '${AppUrl.base_url}${AppUrl.popularMoviesEndpoint}${AppUrl.key}';
    print(url);
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      print(data);
      return PopularMoviesModel.fromJson(data);
    }else{
      print(response.body);
      throw Exception('failed to load data from popular movies with status code of ${response.statusCode}');
    }
  }

  Future<RatingOmdbModel> ratingData(String imdbId)async{
    print('here in rating area');
    final url = '${omdbUrl.baseUrl}${omdbUrl.keySource}&i=$imdbId';
    print(url);
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      print(data);
      return RatingOmdbModel.fromJson(data);
    }else{
      throw Exception('failed to get rating data from omdb api');
    }
  }

  Future<CreditsModel> creditsData(int id)async{
    final url = '${AppUrl.base_url}/movie/$id/credits${AppUrl.key}';
    print(url);
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      print('success');
      final data = jsonDecode(response.body);
      return CreditsModel.fromJson(data);
    }
    else{
      throw Exception('unable to fetch search result data for single movie by id');
    }
  }
}