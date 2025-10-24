import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/user_model.dart';
import 'package:couldai_user_app/widgets/profile_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<User> _users = [
    User(
      name: 'Jessica',
      age: 25,
      bio: 'Lover of life, dogs, and tacos. Let\'s go on an adventure!',
      imageUrls: ['https://images.unsplash.com/photo-1520466809213-7b9a56adcd45?q=80&w=1974&auto=format&fit=crop&ixlib-rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'],
    ),
    User(
      name: 'Samantha',
      age: 28,
      bio: 'Just a girl looking for her guy. I enjoy hiking and reading.',
      imageUrls: ['https://images.unsplash.com/photo-1517841905240-472988babdf9?q=80&w=1974&auto=format&fit=crop&ixlib-rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'],
    ),
    User(
      name: 'Olivia',
      age: 22,
      bio: 'Music festival enthusiast. Looking for someone to dance with.',
      imageUrls: ['https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1974&auto=format&fit=crop&ixlib-rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'],
    ),
  ];

  int _currentIndex = 0;

  void _nextUser() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _users.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {},
        ),
        title: const Text('For You'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ProfileCard(user: _users[_currentIndex]),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(
                  icon: Icons.close,
                  color: Colors.red,
                  onPressed: _nextUser,
                ),
                _buildActionButton(
                  icon: Icons.star,
                  color: Colors.blue,
                  onPressed: _nextUser,
                ),
                _buildActionButton(
                  icon: Icons.favorite,
                  color: Colors.green,
                  onPressed: _nextUser,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({required IconData icon, required Color color, required VoidCallback onPressed}) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.white,
        child: IconButton(
          icon: Icon(icon, size: 30, color: color),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
