import 'package:flutter/material.dart';
import 'package:movie_hub/Utils/Urls.dart';
import 'package:movie_hub/Utils/enum.dart';
import 'package:movie_hub/view_model/movieDetails_view_mode.dart';
import 'package:provider/provider.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int id;

  const MovieDetailsScreen({super.key, required this.id});

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

  final List<CastMember> _castMembers = [
    CastMember(
      name: 'Christian Bale',
      role: 'Alfred Borden',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDAnYTM-cPojax3AZDUwlKpTN8BgQmxsmp5OLkbRqomwxRUXrikER7CP6c1xv46NRjSQk_sOLqMMklqoA2OFWfKCtdiKA98vrtNW0cgCX4sfCNWaXVK8_8ns4Qh3_jsw7rjR5RkzkJ9DYVEHK_OYGCD95Uq-0s6GLd8-bYOjuz8UseSBYhyqzIjdJ30eA8EcYFIWOciuX-3vr8HyYxNRdgYwgAi06XlqrcYg6edNTa5WTyUsT9pU1tQ8MqG6ys4T6Ct4wAv2ai7aqs',
    ),
    CastMember(
      name: 'Hugh Jackman',
      role: 'Robert Angier',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAm6tVobrCPdqZHQdok79QyDoqX2Co8GjZtXBeGXEQKKDjLYo-bo7ACE8P4gcPukUAbknfqQ148TBzbd4LsR8IGKv_Y3WUV8BB0lVlIFukswX7T1poSTyMhuRCQz3DmjrBTqpLKHidnCVRnxlmlwP2RRHFPGjZbN2UIQxPZZqXW5LBuQ1cTCoJvn25zTjWFGb-pgquGasNz7-GLAM9TkFUVbU6Txlo1hcvdi9YWo5oWZHE7Zaq4tmkYKlXJe8LsQeDnJ-cPBuAJ54Y',
    ),
    CastMember(
      name: 'Scarlett Johansson',
      role: 'Olivia Wenscombe',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAwdIiZ7PSmku5nj_3Oyv7m6f5DUR13QnPz43uYVyP0gkBU_usR_mBwCFObHhlB19ah3E3YkVremiMbHk2n64FPrQqQ9MwgiHxi-zjoGd5qcdM9QlSh5gZwLQ4wNU91SKaRp82G-ZgJVVlDNSO4och9GrVdiJZgrjM4mwLOEU_16X_Vt-3afTXCbHMZ7_meukhVWvC3lkKA_zjUGs_LLQXSwq0EDw1ljFrqKsOQfBOfvhAMpG2nQRZi5pd7OoEaRh0MTkqEyXoQffo',
    ),
    CastMember(
      name: 'Michael Caine',
      role: 'Cutter',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAP3GTT1syoSnM9GSBpDOM-XRjjVk3KD82JDL5JIT0xYZ7-O9vx1zc2auSUroHtw6S0cEg2l2iCkj_tUx85yk1HtOICf-a6ue0CuEoOGsHoI9CGaZYwIoT3c_KISt2sfoXZfTzpxIHLXvQb0mvf1zh4-gecFkiQFs3i-kWLUKautezOkm_c0fwFgs4k_b_OZgJl3CP3s8cjjj6STJNrPwlexlU1YeCpTPgl033xORpc-3qzbEb09kq2ouojDlMfUTZysgkUY-BQZTA',
    ),
    CastMember(
      name: 'Piper Perabo',
      role: 'Julia McCullough',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCrR7X8xyvRsKNhfXby0Qk62F0koQVJqXcnV-gflgsx4qZOaDnIB6qWSFzM8X5VjsYH0xC32z1m1wSzVScbUKO2zBtHKU2iXtO0MPYeTOOpiklQEb7G6hRt9OTeSl-vMI7AJDSfgAMLQ7GnDPv3mH3GybhoUtsl4oj3N8sh-e5JglPwfVF1Fkqe0Cb9Bx2HpBLkVNE3mtmd07RxqVevp6LSVYB4EN0Ldzn8yZYMXpJhOjZSZfu6EGmaFeay8LfGhCEIEIk8owc0f44',
    ),
    CastMember(
      name: 'David Bowie',
      role: 'Nikola Tesla',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCCMUv7Qs0boejbUQGeEj3jiOAWRQNzyz3WWh5HSXntWjcRQCkxC-c0sdU_2_Na64ISB7bkoZj-mYQai25-M5xnriQSXOckPVLvpCoSgACdeyxDtxPIsq92KB4pb7XQWE6uTozy_igg89q7_G7PPVti3xxFJy-LMfu6BPPumCGeBKruRRedalgvIsN9dBh0-_cM1IeI2EYX_E7wzgGhavHQ1JnlXKKiWs9erch5sgm3W4ybznIdD5CrWAPBHqbkX0jHCCO04pe1j5Q',
    ),
  ];

  final List<Trailer> _trailers = [
    Trailer(
      title: 'Official Trailer',
      thumbnailUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDYlDAddAyJgJNAfsuW420HeODENjBQiHLT0H650OAZhHfM_20_IZV1o22hOs1JNbzmxTNtxH-WeGqpsscLsIrWaFdI_gkO_YtKznpzkaQcytw3X_xWcFWz1gxlvdWTnb0Jbg4gRq3OgkUhHE5jeVeV-SuZmNF-C5ag3zqp7ywd63K-QvsvBNJJUcYuYj5nOriMIkarDVryflEYAwAT_f5tZqCW3tExIfVhLvPvPJjG6tVCKTZQoC_-xhIwIAcpArflPnJD4rjepqI',
    ),
    Trailer(
      title: 'Movie Clip',
      thumbnailUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBZnPcw-rXLGiWj-QxG17amfvfIsSSgG2aWqnCeLX8s9K8JR9EA5bZXlbMrqr0y-lxO5RukL2ENkDEGznk2C6PZBuvle2eg2XO4XJUhTXPzcLRia7RRMhKozZACqb2_0rCjyeiJl46oqHhc7p7dnH02a5-Sx8ACH3olv-cEGoYRcMAynq35RQX2ur1jTIR9CLq59tV_pbWM8W-wfjYduG5MOyYvex9KpyaEtYjbdkp4PFIkyaRd2uBdLWydO5w6pCbSXl_1PJpqCSM',
    ),
    Trailer(
      title: 'Interview Clip',
      thumbnailUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAlVgpRbQvt2LEuo-MPT1ur9_jT00q_AqIwIOysxVvjk2o-y8nNUVME5cpnylv9MVq-LlIagD86xMqSetP7PnZaljX6IMvyS2AO8_RQOcH1VFF6hD67rSwbUpcPNoEecdlMBrjZbw_T4gZSOyC_gMm-8aXCOyNZzVSXNAZy8pFrG5n1rwOKPAVkbzKhx7t7twl6DJVFX9ex34NBG94_aCEm-DAehK1Sf_5do59yarPVnUHM740ByqazCJlih592kgIipjSbRpq60sg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieDetailsProvider>(
      builder: (context, viewModel, child) {
        switch (viewModel.state) {
          case apiState.initial:
            WidgetsBinding.instance.addPostFrameCallback((_) {
              viewModel.fetchMovieDetails(widget.id);
            });

            return Center(child: CircularProgressIndicator());
          case apiState.loading:
            return Center(child: CircularProgressIndicator());
          case apiState.loaded:
            if (viewModel.movieDetailsModel == null) {
              return const Center(child: Text("Movie details not found"));
            }
            if (viewModel.castModel == null) {
              return const Center(child: Text("Cast not found"));
            }
            final String genre = viewModel.movieDetailsModel!.genres
                .map((e) => e.name)
                .join(',');
            final rating = viewModel.ratingOmdbModel?.ratings ?? [];
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
              length: 4,
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
                        "${AppUrl.imageUrl}${viewModel.movieDetailsModel!.posterPath}",
                      ),

                      // Movie Title and Meta
                      _buildMovieHeader(
                        viewModel.movieDetailsModel!.title,
                        formatTime(viewModel.movieDetailsModel!.runtime),
                        viewModel.movieDetailsModel!.releaseDate
                            .toString()
                            .substring(0, 4),
                        genre,
                      ),

                      // Action Buttons
                      _buildActionButtons(),

                      // Synopsis Section
                      _buildSynopsis(viewModel.movieDetailsModel!.overview),

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
                                  viewModel.setTabIndex(index);
                                },
                                // isScrollable: true,
                                indicatorColor: Colors.purpleAccent,
                                labelColor: Colors.white,
                                unselectedLabelColor: Colors.grey,
                                tabs: [
                                  Tab(text: 'Cast'),
                                  Tab(text: 'Crew'),
                                  Tab(text: 'Details'),
                                  Tab(text: 'Reviews'),
                                ],
                              ),
                            ),
                            AnimatedSwitcher(
                              duration: Duration(milliseconds: 300),
                              child: IndexedStack(
                                key: ValueKey<int>(viewModel.selectedTabIndex),
                                index: viewModel.selectedTabIndex,
                                children: [
                                  ListView.builder(
                                    physics:const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: viewModel.castModel!.cast.length,
                                    itemBuilder: (context, index) {
                                      final path_url = viewModel.castModel?.cast[index].profilePath.toString();
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
                                                  image: NetworkImage((path_url!=null&&path_url!='null')?"${AppUrl.imageUrl}${viewModel.castModel?.cast[index].profilePath.toString()}":'https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_640.png'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              viewModel.castModel?.cast[index].name??'',
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
                                              viewModel.castModel!.cast[index].character.toString()??'',
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
                                  ListView.builder(
                                    physics: const  NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: viewModel.castModel!.crew.length,
                                    itemBuilder: (context, index) {
                                      final path_url = viewModel.castModel?.crew[index].profilePath.toString();
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
                                                  image: NetworkImage((path_url!=null&&path_url!='null')?"${AppUrl.imageUrl}${viewModel.castModel?.crew[index].profilePath.toString()}":'https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_640.png'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              viewModel.castModel?.crew[index].name??'',
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
                                              viewModel.castModel!.crew[index].job.toString()??'',
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
                                  Container(color: Colors.blue,height: 20,width: double.infinity,),
                                  Container(color: Colors.blue,height: 80,width: double.infinity,),
                                ],
                              ),
                            ),


                            // Add other tab contents here...
                          ],
                        ),
                      ),

                      // Trailers Section
                      _buildTrailers(),

                      const SizedBox(height: 20),
                    ],
                  ),
                )
              ),
            );
          case apiState.error:
            return Center(child: Text(viewModel.ErrorMessage.toString()));
        }
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

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                // Add to watchlist functionality
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
              icon: const Icon(Icons.playlist_add, size: 20),
              label: const Text('Add to Watchlist'),
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

  Widget _buildDetailTab(String text, int index) {
    final isSelected = _selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTab = index;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected
                    ? const Color(0xFF5b13ec)
                    : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? const Color(0xFF5b13ec) : Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCastCarousel(
    String name,
    String role,
    String imageUrl,
    int itemsCount,
  ) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemsCount,
        itemBuilder: (context, index) {
          return Container(
            width: 96,
            margin: const EdgeInsets.only(right: 16),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  name,
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
                  role,
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
    );
  }

  Widget _buildTrailers() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Trailers & Clips',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 112,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _trailers.length,
              itemBuilder: (context, index) {
                final trailer = _trailers[index];
                return Container(
                  width: 192,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(trailer.thumbnailUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
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
