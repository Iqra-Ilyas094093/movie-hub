import 'package:flutter/material.dart';
import 'package:movie_hub/view/screens/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedTab = 0;

  final List<WatchlistItem> _watchlistItems = [
    WatchlistItem(
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuDHlH4ayTho40ntmtaanWrpGR_2qpcsRHRUO-FnjwTqMOs1Za0TR11aJiSbBGPS_00JVQ7ixNNYcgp8uXlM9-1Ex22se58G1cXUhuh7Tk_EU-8f-3zcAeybQAaSN1uWYGvaqZ-KbDi9hnzt-VIsmMHdFsYh7JfdSzdV2_ulYpoPkc289V52qQcrR3uBLlzCPaEgb1Z2zClOCQkuwKsLjY25Lmu3OjKLM_Y7LyBEVTRxBBh5Im-nb3bFrouaWgEvnubZBQkUe72MHeg",
      progress: 0.0,
    ),
    WatchlistItem(
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuA7b4kvvOh5g-Y0P5MXlfKiu1svc8sKCFdB1wsPchyp7gNEDwK1LlWMHXIOTE7vQXnizMMiGCB4avArB01g5EMPVvIw4nev58cXIFdqZlRxvwt9bgd2Bt5gYH6ChFttB4lZx2_citv1sqb5L4xdLFWgeGW5eS-mWylwmIRkR9SJvQwOoVjx05S0MmbBJyMI48T-NriOazYB9pFvnm5lo61_dEgOzQDbXEFwM73Oj9EGcWueTv1yJOhiWNeCR0FLXLQwj7ykmthNxUo",
      progress: 0.0,
    ),
    WatchlistItem(
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuCk_LT8uz6-IZCW5_O7YUe6DX9tFpw0PeBdQ-u3FtQ3HbyiFdkFiP7k4WkD5ww5cy65VJ7YsClj38tOcoAQXX0mksk1lMWYphEWRefIh3VY974XU1h8T9RqMAhU2EgG-NW-oMHdTLNd579Z_VcEZOU5apHKRI8PGxfnRN48LZfQJFQgJjhGkqgN6U4_sTWw3r7X35vZmSr2JMJtZdcCjY5eo3y7eYsUD-WQum7aRyOsLtFBnZDmWMryXhVaf_6CDk1dLKQZlfuloHE",
      progress: 0.0,
    ),
    WatchlistItem(
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuCwa8mWsE7ZJR9Phfu7u-tLJNbGcwGltgkGmpPit8LgcMdQjlhMquf6eTaTDqq88dGStGbPjAXqJNaiWjKUhZkDsu00hxQLncpBVLC-8fBCfMk-aGZmabxvExE4KSITApb8i7U6-nH24ZnUoL3_3j8na72nHc0pPjsj-60JY0eV1sOcszgTNBd8uEHxyPQuIhUTU_WuT1_ZjZ-Z0Qo-bLMqqN6M4fR5yOeJo0v6RupbCtTa7PZipwxHTX58a22yKCNMS8FmBEz-PaU",
      progress: 0.75,
    ),
    WatchlistItem(
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuA6eQj9g10tgJrNIqQh3LOTY_w4AOp6fKU3xTh-x5OAb05R9tnd0q8tBnFPeWh-oY1r5_yF61HQEHND8PrZj72_NaaFYmWHvtXjsD-MtwIQaF43HgMd3QfJTdqe2bQXPMW8CbjkcV6yXk_PUmoyihUFpFwiTm_mEXFyo0-arxZeYeucBc38upfGdTITDBZcGksdMXmluv_SMuimp1LmT9LK7Xk5PhSDTSFKf9fC87RLfpwYbkPLBZ_nkgrjpCXHOg0jJMZSXpB5P4E",
      progress: 0.0,
    ),
    WatchlistItem(
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuAm8kF2upON_yBqpRr6bvmA9WVUaRMsrsN5VwT9bvkIN1qzV_hHbs2yRsVjniZ-t3dmxUaL8YFbgZ2qGI_izDKFRNtIvY7VB1DF3fe3z_nAtnbu1F6JMgaOgbOy2WV1ufYNay8VIr_1JDuLk4XHstIM1vktDDHPftGJplA80GiScSNRR-gYtgJrzEk_0O9jOrVCtj_ubGqCb4U7T0cvXKUAHexSugkNL_P02PAd4PWwxjahVDn2uGHEpP6I700VGaQQVEdmHMyOjkw",
      progress: 0.3,
    ),
    WatchlistItem(
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuBZFOitwe-8ucfbWh9mqaQ66P0BzuINELjxd42utI5Wqdm_2mOos7Vpa_DQYm_JhmRbKMEtdUgQZFIlqOptq9DTr3x8ehqgPYRK0uafv-mhHpduk1WgaRGWUDLsnPM0_vrk4_Nh6ik8wvYX9ciaW6ZnLgBoPEXDX71EHbMFAN079O6AML8prTgI6JHvzpXkJNwiaCegULAN70PpGtkTYpVBR1pvuMSBZSqcGpMX461jB4_EVUYRPMdbIld9WicFLfleMySoJiMb55w",
      progress: 0.0,
    ),
    WatchlistItem(
      imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuBo-jcrDvl2D2R-0T9HKPSH49guGN8A11BNA37cLsj9YnVgPMlOkFodoyWPwFx4mx-5iZGMDSGCg683AmecYewQm-IEYpJChMAgmBzjx-WPPUoSoo8x7p831G5lIY6AMXTI8pxzGLJ-abz-OTnpe5VXNDEPrH5HwghjowPHzz5pECWUiM_JiARu9HW47xCWY-n6JepRAhp4vGmXH20StngL9P-Z3sWrhsZNyaozbDLoq3BPuNscTFPhNsJykr8NTsERxUi2tqWE400",
      progress: 0.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF161022),
      body: Stack(
        children: [
          // Background with blur effect
          _buildBackground(),

          // Content
          Column(
            children: [
              // Top App Bar
              Container(
                color: Colors.transparent,
                padding: const EdgeInsets.all(16).copyWith(bottom: 8),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        'Profile',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Open settings
                      },
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),

              // Profile Header
              _buildProfileHeader(),

              // Tabs
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF161022).withOpacity(0.5),
                  border: const Border(
                    bottom: BorderSide(
                      color: Colors.white10,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    _buildProfileTab('Watchlist', 0),
                    _buildProfileTab('History', 1),
                    _buildProfileTab('Preferences', 2),
                  ],
                ),
              ),

              // Watchlist Grid
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
                    return _buildWatchlistItem(_watchlistItems[index]);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Stack(
      children: [
        // Blurred background image
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://lh3.googleusercontent.com/aida-public/AB6AXuCHHlIGqhwd3QaVj5x9Ujvd1c2QWUB2zHDio3WGODWLWdizi6mT_018Q6NFaTI5Bh1uaaniagmXkLwsUGLXonoyjymS3VB6UuYNcTj1ARt6CQ3HqeM83O0oNLdWkzNn3sXI1dEjC8tunzOHfcP_X9Jvm-aQl2qoV7pWbrBc0pS4ScE1FRyDI3a9_iSRjLEF5QSFUlkmmZtpQ_dNH1bPho13ixVSunBYHHfIhMdOGTtTgwfsKhesy03zCk0JSopnThfOHAz_VipplEg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: const ColorFilter.mode(
              Colors.black,
              BlendMode.srcOver,
            ),
            child: Container(
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ),

        // Dark overlay
        Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0xFF161022).withOpacity(0.8),
        ),
      ],
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Profile Picture
          Container(
            width: 128,
            height: 128,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF00BFFF),
                width: 4,
              ),
              image: const DecorationImage(
                image: NetworkImage(
                  "https://lh3.googleusercontent.com/aida-public/AB6AXuBMwKT8h2ruruC2-DnmmbqCxJ8WUNqfM3MGiXsI6DMStG0CIzyt2wzHffZxSeb1240geeO8m_9Zsg7cza0r9bTgx5pH-u_T6Q96JNetWF0uQ6jAG-clg2tx_YGrE0BCkzRrwAbcE5cKEjWtczl-3CwHxfHIYB8pK7ghrcCmojUQEaab3hDgPcQ4YEkNVNnqBSusvYNdbHMz-Kx-kt5THp9s19lGt5Q1uD0wdqhJEQJ1-ZsXlmue0b34JH_7WRnKGAp37KaaHPWJWHQ",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // User Info
          const Column(
            children: [
              Text(
                'John MovieLover',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Joined March 2023',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Edit Profile Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Edit profile functionality
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditProfileScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00BFFF).withOpacity(0.2),
                foregroundColor: const Color(0xFF00BFFF),
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Edit Profile'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileTab(String text, int index) {
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
                color: isSelected ? const Color(0xFF00BFFF) : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWatchlistItem(WatchlistItem item) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Stack(
          children: [
            // Movie Poster with Gradient
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(item.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                      Colors.black54,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // Progress Bar (if any)
            if (item.progress > 0)
              Positioned(
                bottom: 8,
                left: 8,
                right: 8,
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: FractionallySizedBox(
                    widthFactor: item.progress,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF00BFFF),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class WatchlistItem {
  final String imageUrl;
  final double progress;

  WatchlistItem({
    required this.imageUrl,
    required this.progress,
  });
}
