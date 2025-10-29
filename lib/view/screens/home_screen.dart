import 'package:flutter/material.dart';
import 'package:movie_hub/Utils/Urls.dart';
import 'package:movie_hub/Utils/enum.dart';
import 'package:movie_hub/view/screens/movie_details_screen.dart';
import 'package:movie_hub/view/screens/search_screen.dart';
import 'package:movie_hub/view_model/popularMovies_view_model.dart';
import 'package:movie_hub/view_model/topRatedMovies_view_model.dart';
import 'package:movie_hub/view_model/upcomingMovies_view_model.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBarSection(),
              FeaturedMoviesSection(),
              TrendingMoviesSection(),
              UpcomingMoviesSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarSection extends StatelessWidget {
  const AppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF161022),
      padding: const EdgeInsets.all(16).copyWith(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                image: NetworkImage(
                  "https://lh3.googleusercontent.com/aida-public/AB6AXuA_ujXHSKrM-EeypOX2hhYECL0abU3Lq2CDlBIlcjhVnU3Nk9kaIj_jl9dJb6emsiRKdrhJ3OyJKNFdkEd8NgvKuqoAdLSxDLvmjVs7OOikMoaFkwTtBQLbVmfP2Trq7Aw1A9Yw8u34UCTEHVoFkRBZh6RnCBlUVxQuweWalmZ7x-t8dZKmg0s6tjbJfNwuSpneouNJtzmO138sEvsnMO-YuLpae6RpzFLz21r9xkK8L3QbliMOYU32bdw0ZSolpiNi-ugo8v3j4bQ",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchScreen()));
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class FeaturedMoviesSection extends StatelessWidget {
  const FeaturedMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PopularMoviesProvider>(
      builder: (context, viewModel, child) {
        switch(viewModel.state){
          case apiState.initial:
            WidgetsBinding.instance.addPostFrameCallback((_){
              viewModel.getPopularMoviesData();
            });
            return Center(child: CircularProgressIndicator(),);
          case apiState.loading:
            return Center(child: CircularProgressIndicator(),);
          case apiState.loaded:
            final movie = viewModel.popularMoviesModel;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: SizedBox(
                      height: 420,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
              itemCount: movie!.results.length,
              itemBuilder: (context,index){
                      return FeaturedMovieCard(imageUrl: '${AppUrl.imageUrl}${movie.results[index].backdropPath}', title: movie.results[index].title, subtitle: movie.results[index].overview,id: movie.results[index].id,);
                      })
                      ),
            );
          case apiState.error:
            return Center(
              child: Text(viewModel.ErrorMessage.toString()),
            );
        }
      },
    );
  }
}

class TrendingMoviesSection extends StatelessWidget {
  const TrendingMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    print('building trending movies');
    return Consumer<topRatedMoviesProvider>(builder: (context,viewModel ,child){
      switch(viewModel.state){
        case apiState.initial:
          WidgetsBinding.instance.addPostFrameCallback((_){
            viewModel.getTopRatedData();
          });
          return Center(child: CircularProgressIndicator(),);
        case apiState.loading:
          return Center(child: CircularProgressIndicator(),);
        case apiState.loaded:
          final movie = viewModel.topRatedMovies;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16,8, 8, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Trending Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          color: Color(0xFF5b13ec),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  height: 250,
                  child:ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: movie!.results.length,
                      itemBuilder: (context,index){
                      print("${AppUrl.imageUrl}${
                          movie.results[index].posterPath
                      }");
                    return MoviePosterCard(imageUrl: "${AppUrl.imageUrl}${
                      movie.results[index].backdropPath
                    }", title: movie.results[index].title, year: movie.results[index].releaseDate.toString());
                  })
                ),
              ),
            ],
          );
        case apiState.error:
          return Center(child: Text(viewModel.errorMessage??'Error'),);
      }
    },);

  }
}

class UpcomingMoviesSection extends StatelessWidget {
  const UpcomingMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UpcomingMoviesProvider>(builder: (context,viewModel ,child){
      switch(viewModel.state){
        case apiState.initial:
          WidgetsBinding.instance.addPostFrameCallback((_){
            viewModel.getUpcomingMoviesData();
          });
          return Center(child: CircularProgressIndicator(),);
        case apiState.loading:
          return Center(child: CircularProgressIndicator(),);
        case apiState.loaded:
          final movie = viewModel.upcomingMoviesModel;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16,8, 8, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Upcoming Movies',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          color: Color(0xFF5b13ec),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                    height: 250,
                    child:ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movie!.results.length,
                        itemBuilder: (context,index){
                          print("${AppUrl.imageUrl}${
                              movie.results[index].backdropPath
                          }");
                          return MoviePosterCard(imageUrl: "${AppUrl.imageUrl}${
                              movie.results[index].posterPath
                          }", title: movie.results[index].title, year: movie.results[index].releaseDate.toString());
                        })
                ),
              ),
            ],
          );
        case apiState.error:
          return Center(child: Text(viewModel.ErrorMessage??'Error'),);
      }
    },);
  }
}

