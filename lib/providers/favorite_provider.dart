import 'package:flutter/foundation.dart';

class FavoriteProvider extends ChangeNotifier {
  final Set<String> _favorites = {};

  int get count => _favorites.length;

  bool isFavorite(String name) => _favorites.contains(name);

  void toggle(String name) {
    if (_favorites.contains(name)) {
      _favorites.remove(name);
    } else {
      _favorites.add(name);
    }
    notifyListeners();
  }

  void clearAll() {
    _favorites.clear();
    notifyListeners();
  }
}