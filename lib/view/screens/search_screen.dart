import 'package:flutter/material.dart';
import 'package:movie_hub/view_model/searchMovies_view_model.dart';
import 'package:movie_hub/view_model/try.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();


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


  final List<RecentSearch> _recentSearches = [
    RecentSearch(icon: Icons.history, text: 'Recent Searches'),
    RecentSearch(icon: Icons.search, text: 'The Dark Knight'),
    RecentSearch(icon: Icons.search, text: 'Tom Hanks'),
  ];

  final List<Movie> _trendingMovies = [
    Movie(
      title: 'Inception',
      genres: 'Action, Sci-Fi, Thriller',
      rating: 8.8,
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuB8r6Ai5DHXCqxyYR0xjthZbDkG5WYz_g1rnaJvNH8GkuiaGnUPxWeIPUSmwaJEm6A1_txqHeKMPpdeL1sdUx_khPBAs6zNhVu3bckUZ7X9e1Nf8cf6x9H0V93ZRQr5zE25FqAdzzKph0_KM1vG9J7O4OT4oStvGQiWD2NA34ZLwFrvnWMsyXrZXfIYCrFQoyFdGkPPAIcCtUCFH87v9eSdybK7hRTLAsnqSeyCu9t-RzDbrjryucdFFgu1RkDLNuMIZIIZonsFwf4',
    ),
    Movie(
      title: 'Dune',
      genres: 'Adventure, Drama, Sci-Fi',
      rating: 8.0,
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDuNCHTiTgnyF5nGOV4Yk2lUhw8r8JtZ7WgGk8O3oWBCXmDbu5jidubjnRnRveI_x93WiZAEaPteJquyn8o7qdPRWuhTOUkxy4yOmKOJrwyAJCViQ-_M2EOO1Wb9jytc1p_l53_pf22qplBT1fuWBPf9q7peBR87v-E8Ti1i8iLb0SHHB_ORoIi7V1nr6QnUBiiD69ri1-Y6IZznxw_-3B4W0ymLojvzc5r71CqIWaAor3nj_OK1QJCTunnsFMD3-NfWHEctQj8jro',
    ),
  ];

  final List<Genre> _genres = [
    Genre(name: 'Action', isSelected: false),
    Genre(name: 'Comedy', isSelected: false),
    Genre(name: 'Horror', isSelected: false),
    Genre(name: 'Sci-Fi', isSelected: true),
    Genre(name: 'Thriller', isSelected: false),
    Genre(name: 'Romance', isSelected: false),
  ];

  void _removeRecentSearch(int index) {
    setState(() {
      _recentSearches.removeAt(index);
    });
  }

  void _toggleGenre(int index) {
    setState(() {
      _genres[index] = Genre(
        name: _genres[index].name,
        isSelected: !_genres[index].isSelected,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchMoviesProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xFF161022),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: const Color(0xFF161022),
              padding: const EdgeInsets.all(16).copyWith(bottom: 8),
              child: Text(
                'Search',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                      ),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white60,
                        size: 24,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        focusNode: _searchFocusNode,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Search for movies, actors, and genres',
                          hintStyle: TextStyle(
                            color: Colors.white60,
                            fontSize: 16,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        ),
                        onSubmitted: (query)async {
                          final query = _searchController.text.trim();
                          if (query.isNotEmpty) {
                            if (!_recentSearches.any((search) => search.text == query)) {
                              setState(() {
                                _recentSearches.insert(1, RecentSearch(
                                  icon: Icons.search,
                                  text: query,
                                ));
                              });
                            }
                          }
                          await provider.getSearchResults(query);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: _searchController.text.isEmpty?ListView(
                children: [
                  // Recent Searches Section
                  if (_recentSearches.isNotEmpty) ...[
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Text(
                        'Recent Searches',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ..._recentSearches.asMap().entries.map((entry) {
                      final index = entry.key;
                      final search = entry.value;
                      return _buildRecentSearchItem(search, index);
                    }).toList(),
                  ],

                  // Trending Section
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
                    child: Text(
                      'Trending',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ..._trendingMovies.map((movie) => _buildTrendingMovie(movie)).toList(),

                  // Genres Section
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 24, 16, 12),
                    child: Text(
                      'Genres',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: _genres.asMap().entries.map((entry) {
                        final index = entry.key;
                        final genre = entry.value;
                        return _buildGenreChip(genre, index);
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              )
                  :MovieSearchScreen()
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentSearchItem(RecentSearch search, int index) {
    return Container(
      height: 56,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              search.icon,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              search.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            onPressed: () => _removeRecentSearch(index),
            icon: const Icon(
              Icons.close,
              color: Colors.white,
              size: 24,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(
              minWidth: 28,
              minHeight: 28,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrendingMovie(Movie movie) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 96,
            height: 128,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(movie.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  movie.genres,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      movie.rating.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenreChip(Genre genre, int index) {
    return GestureDetector(
      onTap: () => _toggleGenre(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: genre.isSelected
              ? const Color(0xFF5b13ec)
              : Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          genre.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: genre.isSelected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class RecentSearch {
  final IconData icon;
  final String text;

  RecentSearch({
    required this.icon,
    required this.text,
  });
}

class Movie {
  final String title;
  final String genres;
  final double rating;
  final String imageUrl;

  Movie({
    required this.title,
    required this.genres,
    required this.rating,
    required this.imageUrl,
  });
}

class Genre {
  final String name;
  final bool isSelected;

  Genre({
    required this.name,
    required this.isSelected,
  });
}