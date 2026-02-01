import 'package:flutter/material.dart';
import 'package:movie_hub/view/screens/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF161022),
      appBar: AppBar(title: Text(
        'Profile',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),centerTitle: true,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          _buildProfileHeader(),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
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
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
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

}

class WatchlistItem {
  final String imageUrl;
  final double progress;

  WatchlistItem({
    required this.imageUrl,
    required this.progress,
  });
}
