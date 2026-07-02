import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorite_provider.dart';
import 'character_page.dart';
import 'home_page.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<FavoriteProvider>(context).favorites;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Favorite Characters',
          style: TextStyle(
            fontFamily: 'Ditty',
          ),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Back to Home',
          onPressed: () {
            // Navigate back to HomePage and remove all previous routes
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (route) => false,
            );
          },
        ),
      ),
      body: favorites.isEmpty
          ? const Center(
              child: Text(
                'No favorites yet.\nGo to Characters and tap the heart icon!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final character = favorites[index];
                return Card(
                  color: Colors.grey[900],
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                        character['thumb'] ?? character['image'] ?? '',
                      ),
                      backgroundColor: Colors.black,
                    ),
                    title: Text(
                      character['name'] ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      character['description'] ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white70),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () {
                        Provider.of<FavoriteProvider>(context, listen: false)
                            .removeFavorite(character['name'] ?? '');
                      },
                      tooltip: 'Remove from Favorites',
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CharacterPage(),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      backgroundColor: Colors.black,
    );
  }
}
