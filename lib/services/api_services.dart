import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:movie_hub/Utils/Urls.dart';
import 'package:movie_hub/model/case_details_model.dart';
import 'package:movie_hub/model/movie_details_model.dart';
import 'package:movie_hub/model/popular_movie_model.dart';
import 'package:movie_hub/model/ratingData_model.dart';
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

  Future<MovieDetailsModel> movieDeaitlsData(int id)async{
    final url = '${AppUrl.base_url}/movie/$id${AppUrl.key}';
    print(url);
    final response = await http.get(Uri.parse(url));
    print(response.statusCode);
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      return MovieDetailsModel.fromJson(data);
    }else{
      throw Exception('failed to fetch the movie detials with status code ${response.statusCode}');
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

  Future<CastModel> castData(int id)async{
    final url = "${AppUrl.base_url}/movie/$id/credits${AppUrl.key}";
    print(url);
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      print(data);
      return CastModel.fromJson(data);
    }else{
      throw Exception('failed to load cast data from api');
    }
  }

}