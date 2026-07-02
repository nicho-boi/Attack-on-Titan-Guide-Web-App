import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Map<String, String>> _favorites = [];

  List<Map<String, String>> get favorites => _favorites;

  void addFavorite(Map<String, String> character) {
    if (!_favorites.any((c) => c['name'] == character['name'])) {
      _favorites.add(character);
      notifyListeners(); // This is key!
    }
  }

  void removeFavorite(String name) {
    _favorites.removeWhere((c) => c['name'] == name);
    notifyListeners(); // Also key!
  }

  bool isFavorite(String name) {
    return _favorites.any((c) => c['name'] == name);
  }
}