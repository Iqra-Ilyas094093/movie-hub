import 'package:flutter/material.dart';
import 'package:movie_hub/Utils/Urls.dart';
import 'package:movie_hub/Utils/enum.dart';
import 'package:movie_hub/view_model/searchById_view_model.dart';
import 'package:movie_hub/view_model/wishlist_view_model.dart';
import 'package:provider/provider.dart';

class MovieDetailsScreen extends StatefulWidget {

  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  int _selectedTab = 0;

  String formatTime(int minutes) {
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    return '${hours}h ${mins}min';
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchMovieByIdProvider>(
      builder: (context, viewModel, child) {
        if(viewModel.state == apiState.loading){
          return Center(child: CircularProgressIndicator(),);
        }
        if(viewModel.state == apiState.error){
          return Center(child: Text('Failed to load data for this movie'),);
        }
        final cast = viewModel.creditsModel?.cast ?? [];
        final crew = viewModel.creditsModel?.crew ?? [];
        final String genre = viewModel.singleMovieIdSearch!.genres
            .map((e) => e.name)
            .join(',');
        final rating =  [];
        String imdbId = 'N/A';
        String rottenTomatoes = 'N/A';
        for (var r in rating) {
          if (r.source == "Internet Movie Database") {
            imdbId = r.value;
          } else if (r.source == "Rotten Tomatoes") {
            rottenTomatoes = r.value;
          }
        }
        return DefaultTabController(
          length: 2,
          child: Scaffold(
              backgroundColor: const Color(0xFF161022),
              appBar: AppBar(
                backgroundColor: const Color(0xFF131118),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                title: const Text(
                  'Movie Details',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      // Add to watchlist functionality
                    },
                    icon: const Icon(
                      Icons.bookmark_add,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    _buildMediaPlayer(
                      "${AppUrl.imageUrl}${viewModel.singleMovieIdSearch!.posterPath}",
                    ),

                    // Movie Title and Meta
                    _buildMovieHeader(
                      viewModel.singleMovieIdSearch!.title,
                      formatTime(viewModel.singleMovieIdSearch!.runtime),
                      viewModel.singleMovieIdSearch!.releaseDate
                          .toString()
                          .substring(0, 4),
                      genre,
                    ),

                    // Action Buttons
                    _buildActionButtons(viewModel.singleMovieIdSearch!.id),

                    // Synopsis Section
                    _buildSynopsis(viewModel.singleMovieIdSearch!.overview),

                    // Ratings Section
                    _buildRatings(imdbId, rottenTomatoes),

                    // Tabbed Information
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Tabs
                          SizedBox(
                            height: 48,
                            child: TabBar(
                              onTap: (index){

                              },
                              // isScrollable: true,
                              indicatorColor: Colors.purpleAccent,
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.grey,
                              tabs: [
                                Tab(text: 'Cast'),
                                Tab(text: 'Crew'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 200,
                            child: TabBarView(
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                cast.isNotEmpty?Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: cast.length,
                                    itemBuilder: (context, index) {
                                      final pathUrl = cast[index].profilePath.toString();
                                      return Container(
                                        width: 100,
                                        margin: const EdgeInsets.only(
                                          right: 16,
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 80,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image: NetworkImage((pathUrl!='null')?"${AppUrl.imageUrl}${cast[index].profilePath.toString()}":'https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_640.png'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              cast[index].name,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              cast[index].character.toString(),
                                              style: const TextStyle(
                                                color: Color(0xFFa69db9),
                                                fontSize: 12,
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ):Center(child: Text('Cast is not updated yet'),),
                                crew.isNotEmpty?Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: crew.length,
                                    itemBuilder: (context, index) {
                                      final pathUrl = crew[index].profilePath.toString();
                                      return Container(
                                        width: 100,
                                        margin: const EdgeInsets.only(
                                          right: 16,
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 80,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image: NetworkImage((pathUrl!='null')?"${AppUrl.imageUrl}${crew[index].profilePath.toString()}":'https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_640.png'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              crew[index].name=='null'?'':crew[index].name,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              crew[index].character.toString()??'',
                                              style: const TextStyle(
                                                color: Color(0xFFa69db9),
                                                fontSize: 12,
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ):Center(child: Text('Crew is not updated yet'),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              )
          ),
        );
      },
    );
  }

  Widget _buildMediaPlayer(String imageUrl) {
    print(imageUrl);
    return Container(
      height: 240,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {
              // Play movie functionality
            },
            icon: Icon(Icons.play_arrow, color: Colors.white, size: 32),
          ),
        ),
      ),
    );
  }

  Widget _buildMovieHeader(
    String title,
    String duration,
    String releaseYear,
    String genre,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            '$releaseYear • $genre • $duration',
            style: TextStyle(color: Color(0xFFa69db9), fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(int id) {
    return Consumer<WishListProvider>(
      builder: (context, vm, child) {
        if(vm.state == apiState.loading){
          return Center(child: CircularProgressIndicator(),);
        }
        if(vm.state == apiState.error){
          return Center(child: Text(vm.errorMessage.toString()),);
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    vm.toggleMovie(id);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5b13ec),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: vm.movieIds.contains(id)?Icon(Icons.playlist_remove): Icon(Icons.playlist_add, size: 20),
                  label: vm.movieIds.contains(id)?Text('Remove from Wishlist'):Text('Add to Watchlist'),
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton.icon(
                onPressed: () {
                  // Share functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2e2839),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: const Icon(Icons.share, size: 20),
                label: const Text('Share'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSynopsis(String overview) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Synopsis',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            overview,
            style: TextStyle(
              color: Color(0xFFdcd6e9),
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatings(String rating, String rottenPotatoes) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ratings',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _RatingItem(
                  platform: 'IMDb',
                  rating: rating,
                  maxRating: '/10',
                  icon: Icons.star,
                  iconColor: Colors.yellow,
                ),
              ),
              Expanded(
                child: _RatingItem(
                  platform: 'Rotten Tomatoes',
                  rating: rottenPotatoes,
                  maxRating: '',
                  icon: Icons.refresh,
                  iconColor: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}

class _RatingItem extends StatelessWidget {
  final String platform;
  final String rating;
  final String maxRating;
  final IconData icon;
  final Color iconColor;

  const _RatingItem({
    required this.platform,
    required this.rating,
    required this.maxRating,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          platform,
          style: const TextStyle(
            color: Color(0xFFa69db9),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 20),
            const SizedBox(width: 4),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: rating,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CastMember {
  final String name;
  final String role;
  final String imageUrl;

  const CastMember({
    required this.name,
    required this.role,
    required this.imageUrl,
  });
}

class Trailer {
  final String title;
  final String thumbnailUrl;

  const Trailer({required this.title, required this.thumbnailUrl});
}
Widget _buildReviewItem(
    String avatarUrl,
    String name,
    String time,
    double rating,
    String review,
    ) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage(avatarUrl),
      ),
      const SizedBox(width: 16),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                        color: Color(0xFFa69db9),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2e2839),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              review,
              style: const TextStyle(
                color: Color(0xFFdcd6e9),
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
