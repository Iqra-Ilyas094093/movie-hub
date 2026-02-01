import 'package:flutter/material.dart';
import 'package:movie_hub/Utils/Urls.dart';
import 'package:movie_hub/Utils/enum.dart';
import 'package:movie_hub/model/single_movie_id_search.dart';
import 'package:movie_hub/view_model/wishlist_view_model.dart';
import 'package:provider/provider.dart';

import '../../Utils/movie_details_route.dart';
import '../../services/respository.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF161022),
      body: SafeArea(
        child: Consumer<WishListProvider>(
          builder: ( context, vm,  child) {
            WidgetsBinding.instance.addPostFrameCallback((_){
              if(vm.state == apiState.initial){
                vm.loadAllMovies();
              }
            });
            if(vm.state == apiState.loading){
              return Center(child: CircularProgressIndicator(),);
            }
            if(vm.state == apiState.error){
              return Center(child: Text(vm.errorMessage.toString()),);
            }
            return Column(
              children: [
                const SizedBox(height: 10,),
                // Top App Bar
                Container(
                  color: const Color(0xFF161022),
                  child: Text(
                    'My Watchlist',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),


                // Watchlist Grid
                if (vm.movieIds.isNotEmpty)
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 2 / 3,
                      ),
                      itemCount: vm.movies.length,
                      itemBuilder: (context, index) {
                        return WatchlistItemCard(
                          movie: vm.movies[index],
                          onRemove: () => vm.toggleMovie(vm.movieIds[index]),
                        );
                      },
                    ),
                  )
                else
                  const Expanded(
                    child: EmptyWatchlistState(),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

enum WatchlistType { movie, tv }

class WatchlistItem {
  final String imageUrl;
  final WatchlistType type;

  WatchlistItem({
    required this.imageUrl,
    required this.type,
  });
}

class WatchlistItemCard extends StatefulWidget {
  final SingleMovieIdSearch movie;
  final VoidCallback onRemove;

  const WatchlistItemCard({
    super.key,
    required this.movie,
    required this.onRemove,
  });

  @override
  State<WatchlistItemCard> createState() => _WatchlistItemCardState();
}

class _WatchlistItemCardState extends State<WatchlistItemCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Stack(
        children: [
          // Movie/Show Poster
          GestureDetector(
            onTap: (){
              Navigator.push(context, movieDetailsRoute(widget.movie.id, MovieRepository()));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage('${AppUrl.imageUrl}${widget.movie.posterPath.toString()}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Hover Overlay with Remove Button
          if (_isHovered)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black.withOpacity(0.6),
              ),
              child: Center(
                child: ElevatedButton.icon(
                  onPressed: widget.onRemove,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF007BFF).withOpacity(0.8),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                  icon: const Icon(Icons.bookmark_remove, size: 18),
                  label: const Text(
                    'Unsave',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class EmptyWatchlistState extends StatelessWidget {
  const EmptyWatchlistState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.movie,
          color: Colors.white.withOpacity(0.3),
          size: 64,
        ),
        const SizedBox(height: 16),
        const Text(
          'Your watchlist is empty',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Text(
            'Tap the bookmark icon on any movie or show to add it here.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white60,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}