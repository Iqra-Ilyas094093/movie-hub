import 'package:flutter/material.dart';
import 'package:movie_hub/view/widgets/Navigation.dart';
import 'package:movie_hub/view_model/popularMovies_view_model.dart';
import 'package:movie_hub/view_model/searchMovies_view_model.dart';
import 'package:movie_hub/view_model/topRatedMovies_view_model.dart';
import 'package:movie_hub/view_model/upcomingMovies_view_model.dart';
import 'package:movie_hub/view_model/wishlist_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>topRatedMoviesProvider()),
        ChangeNotifierProvider(create: (create)=>UpcomingMoviesProvider()),
        ChangeNotifierProvider(create: (create)=>PopularMoviesProvider()),
        ChangeNotifierProvider(create: (create)=>SearchMoviesProvider()),
        ChangeNotifierProvider(create: (create)=>WishListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'PlusJakartaSans',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF5b13ec),
            brightness: Brightness.light,
            background: const Color(0xFFf6f6f8),
          ),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          fontFamily: 'PlusJakartaSans',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF5b13ec),
            brightness: Brightness.dark,
            background: const Color(0xFF161022),
          ),
        ),
        home:Navigation(),
      ),
    );
  }
}
