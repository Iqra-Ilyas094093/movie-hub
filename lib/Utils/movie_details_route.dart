import 'package:flutter/material.dart';
import 'package:movie_hub/view_model/searchById_view_model.dart';
import 'package:provider/provider.dart';

import '../services/respository.dart';
import '../view/screens/movie_details_screen.dart';

Route movieDetailsRoute(
    int movieId,
    MovieRepository repository,
    ) {
  return MaterialPageRoute(
    builder: (_) => ChangeNotifierProvider(
      create: (_) => SearchMovieByIdProvider(repository: repository)..getSingleMovieDataById(movieId),
      child: const MovieDetailsScreen(),
    ),
  );
}
