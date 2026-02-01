import 'package:flutter/material.dart';
import 'package:movie_hub/Utils/Urls.dart';
import 'package:movie_hub/Utils/enum.dart';
import 'package:movie_hub/Utils/movie_details_route.dart';
import 'package:movie_hub/view/screens/movie_details_screen.dart';
import 'package:movie_hub/view_model/searchMovies_view_model.dart';
import 'package:provider/provider.dart';

class MovieSearchScreen extends StatefulWidget {
  const MovieSearchScreen({super.key});

  @override
  State<MovieSearchScreen> createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {

  final List<Map<String, dynamic>> movies = [
    {
      'title': 'Interstellar',
      'year': '2014',
      'genre': 'Sci-Fi',
      'rating': 8.7,
      'imageUrl': 'https://lh3.googleusercontent.com/aida-public/AB6AXuDTGUv1s7Ejxn7Xf8y3w2cheI5A6rtSkz2cp2p3YF3heirQhokPMnxFgqOqGusZ6njCELOfzL_kJTP2594F_R3jc6isn-9H6MEyPlyqvazeuS_S1a7dj4DnOB8Rtyw4IP3ZBtX4HuniZ-aCeIE-2dfAPKsDHlTk7pnU7fYcMQYnShYKCEwvkE_uvJDyx8xwKDohO5sfiy5iF_lL2trQbMj-0QoNhr712CmGPcvQcGLSGGEpTdVmGaRgkk-EASOzpSxjZl4eYL6VDk4',
    },
    {
      'title': 'Beyond the Stars',
      'year': '2021',
      'genre': 'Documentary',
      'rating': 7.2,
      'imageUrl': 'https://lh3.googleusercontent.com/aida-public/AB6AXuBnhRdDSAqIwgyKqhkUXjqAh3w3FhoXhqzUOO5VcukJfnvhK6j3MSi_g5dkHRsEmApiwdI1SYeUTrZ6nyxfv9WbY-dPjo7poAfZEFDCB38vtBiBaxtkXAj2u6-lRQU01NgoiK_wqTukzPkTWDqzCy4_FUF3ApuhqdIcaBuMZUQ_xK5nTROp_keZu-EEHErirYltT3TpU-sE4rNgIdUywESgRE0YtLpkgYQbs-zH1-jT-4kQFky_pPN-i6-7avZh-sfGW8YSq8U6n5c',
    },
    {
      'title': 'Mars Horizon',
      'year': '2023',
      'genre': 'Adventure',
      'rating': 8.1,
      'imageUrl': 'https://lh3.googleusercontent.com/aida-public/AB6AXuDoiedPtiIT-ypWYccQN0quyalgWlrma8BNQJz8eTuEGLa_hazJxF3zUHum-CIVVCfyA2pNW_cxu7GboIwWQ_9BimnOD_W4wCDc84BWNFeQCceakOWPJzSbn-t1m9VNwnrvHWgq4mexyA2WDHLF9MM9gmcC7f0lJtigCs1mkcEPTxFjdTe5BujH4c9ZQcXNeJ7n3MnvLzByj2b7LoQ9vevWrUXiqyYLVTMZR4l7I8KOjXDkrfoSIvigEBBEqA46FA1NeDw7_PY3Oeo',
    },
    {
      'title': 'Project Gargantua',
      'year': 'Coming Soon',
      'genre': 'Sci-Fi',
      'rating': null,
      'imageUrl': null,
    },
  ];

  final List<String> tabs = ['Movies', 'TV Shows', 'People'];
  final List<String> filters = ['Genre', 'Year', 'Rating', 'Streaming'];

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchMoviesProvider>(
      builder: (context, vm,child) {
        if(vm.state == apiState.loading){
          return Center(child: CircularProgressIndicator(),);
        }
        if(vm.state == apiState.error){
          return Center(child: Text('Error finding data'),);
        }
        if(vm.searchResultModel!.results.isEmpty){
          return Center(child: Text('No movies found'),);
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${vm.searchResultModel!.results.length} results found",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 2 / 3.5,
                  ),
                  itemCount: vm.searchResultModel!.results.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, movieDetailsRoute(vm.searchResultModel!.results[index].id, vm.repository));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: const Color(0xFF1c1c1e),
                                image: vm.searchResultModel!.results[index].posterPath!=null
                                    ? DecorationImage(
                                  image: NetworkImage('${AppUrl.imageUrl}${vm.searchResultModel!.results[index].posterPath}'),
                                  fit: BoxFit.cover,
                                )
                                    : null,
                              ),
                              child: vm.searchResultModel!.results[index].posterPath == null
                                  ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFF5b13ec),
                                      Colors.black,
                                    ],
                                  ),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.movie,
                                    color: Colors.white30,
                                    size: 64,
                                  ),
                                ),
                              )
                                  : Stack(
                                children: [
                                  // Rating badge
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.6),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 14,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                           vm.searchResultModel!.results[index].popularity.toString(),
                                            style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                         vm.searchResultModel!.results[index].title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BeVietnamPro',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                        vm.searchResultModel!.results[index].releaseDate,
                          style: const TextStyle(
                            color: Color(0xFF9ca3af),
                            fontSize: 12,
                            fontFamily: 'BeVietnamPro',
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        );
      },
    );
  }
 }