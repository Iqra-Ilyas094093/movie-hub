import 'package:flutter/material.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  int _selectedTab = 0;
  String _sortOption = 'Recently Added';

  final List<WatchlistItem> _watchlistItems = [
    WatchlistItem(
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuD_cNcTJMlOm5p8Qj_3VlLF8hqY8dHQBtVfkY3xe_3TWTd64RNBs1BTg6KSG6gNb_hgoLJcoq0PDExyHp-E-Xl3nxOLI6NvVIkE07YPUTUpINZbaCAGBBiEsuk88odPwrLSdsV9Si-rh55es45xX6iU3SqYr0AQVMNJbdOPHi07LWF1a9bizcWLffVaAu5RHsTIvFXlL4rAa9YoX1ZGkVWHB3Yv25tt7K9N1_kUuYJ7nC_Vf26MaJfFtxfkFKzrA4-2gXEvevvPWyQ",
      type: WatchlistType.movie,
    ),
    WatchlistItem(
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuBEzDMCRkLpnnON8jvlUIqKhQboPDmfM19cIMDG0Erq27h46c7F-ysvx284_Me8bfvyOpiMwJSuB66_qJCKa4yDb2sIbwfPUz9boBgYJ-0Aqr5ukRl92Qh7gh40ImZ587ET7nyNHsziS4TOLpxB5c-dU8f90EO91TJuBTMkl2fxl_8kssnhauFK3zN0Fb6thEczHRoGrpWkjPEmnyjCzRk6m84MNfshlhfgxsNCekWMkJrbXNVGckoRAnqP-5vyyqdqagj-tjYchbg",
      type: WatchlistType.tv,
    ),
    WatchlistItem(
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuBAlC8apbg0DNBK_fEXgKRKQiIerFZJ492u0HUqTiTih2IRDeaEOE32BUfuiiA-zKBZLnLiA7hgPwQQPUsHH6iNiBhhT1hXryDMTrIrE5qB92rHu7jhp_EhZvASvkkqiNOfojmaCTTdy7UwY99wMAM2huFffV5xQOPGmYaSJ_ybBqLi_-H1nxTs0j-Z2L0705ZkQ920-8HsHlni4anDXd69pRHPeGQihjPdByybu2F_34naYy-xOO25W4NJgySFZslLeaW8Le4zxR8",
      type: WatchlistType.movie,
    ),
    WatchlistItem(
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuAfekVqrC_irgD4Ah5_b3lq_Ewvkh_fh2IVrehoJglwxlS3qDbC2QfBJrRyFVZjBm2rJDUMAhivvhCsIVadTjMz4T9dg4EwpssKdZdk3gJbfnXFVruyXJzqLWzji8WKCeJ4me7awpYVaL8yzAaCZm3JAuqvWY2UcC5pLOWBZn5n3VZAOaTOn1f6e9--iN9VZ2CkloFYPqBe8dabHzumfLx2FG3A-1OP-BXi2zQ1HSd7XA8uajWpd82Y7Ht0nOyIMG--L_lVgf50c68",
      type: WatchlistType.tv,
    ),
    WatchlistItem(
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuAT88lAI7U1-u08OtuQuT_i0X2mx0Aq0J7z3Z09tp9HFLgEnbzgOzE6ThlhtnLBR5LcPCFmjUFQkI2-I0Z_is7lS-96qjcOZIPAnwGkkKgXCtU-LK8uejJmytPzVBPOt8Cgg11tH2Gb7_hQzPhr84F2SJpy0wQ6nHZUqZt3cwBOKFlBkML2FH4AIg-I8hKTO9SfLFaCtOjldPTt3-pzrr_SBNa3Zjad-x9NtQgYq7Nn3y3Mhc0K8MuDKxGTnstSs0q7ZTyxX6G3uJg",
      type: WatchlistType.movie,
    ),
    WatchlistItem(
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuDk6wiRwHgFCz2D4owE8o_N6lg21q_qEe_6cfEn1jAoBOkPFkdrMJkc1b488nI6nyeidvl1TduAFZVUwcONK6lsXOjUEAxGH7ixnjkOewnMepOXtlwf8wRzx7Tn1PWQVOCPeMCvPO-g7m54zHb_Y9lSnYaA-l3ASlMv-fr8fOs6mkdhFZcWP5S_IpXtHWMsRraBLJYEBzuzXKnlRd7U7x5kPeVQbgXscROvsbh_AQqd7LWzE0a9-o1iPWamr65VzEOWhOWnofgNd-g",
      type: WatchlistType.movie,
    ),
  ];

  void _removeFromWatchlist(int index) {
    setState(() {
      _watchlistItems.removeAt(index);
    });
  }

  void _showSortOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Sort By',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              ...['Recently Added', 'Title A-Z', 'Release Date', 'Rating']
                  .map((option) => ListTile(
                title: Text(
                  option,
                  style: TextStyle(
                    color: _sortOption == option
                        ? const Color(0xFF007BFF)
                        : Colors.white,
                    fontWeight: _sortOption == option
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                trailing: _sortOption == option
                    ? const Icon(
                  Icons.check,
                  color: Color(0xFF007BFF),
                )
                    : null,
                onTap: () {
                  setState(() {
                    _sortOption = option;
                  });
                  Navigator.pop(context);
                },
              ))
                  .toList(),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF161022),
      body: Column(
        children: [
          // Top App Bar
          Container(
            color: const Color(0xFF161022),
            padding: const EdgeInsets.all(16).copyWith(bottom: 8),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const Expanded(
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
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.filter_list,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),

          // Tabs
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.white10,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                _buildTab('All', 0),
                _buildTab('Movies', 1),
                _buildTab('TV Shows', 2),
              ],
            ),
          ),

          // Sort Dropdown
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: _showSortOptions,
                  child: Row(
                    children: [
                      Text(
                        _sortOption,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.expand_more,
                        color: Colors.white70,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Watchlist Grid
          if (_watchlistItems.isNotEmpty)
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: _watchlistItems.length,
                itemBuilder: (context, index) {
                  return WatchlistItemCard(
                    item: _watchlistItems[index],
                    onRemove: () => _removeFromWatchlist(index),
                  );
                },
              ),
            )
          else
            const Expanded(
              child: EmptyWatchlistState(),
            ),
        ],
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    final isSelected = _selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTab = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.only(bottom: 13, top: 16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? const Color(0xFF007BFF) : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white60,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
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
  final WatchlistItem item;
  final VoidCallback onRemove;

  const WatchlistItemCard({
    super.key,
    required this.item,
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
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(widget.item.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Type Indicator
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(
                widget.item.type == WatchlistType.movie
                    ? Icons.movie
                    : Icons.tv,
                color: Colors.white,
                size: 16,
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