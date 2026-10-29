import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final Set<String> _favorites = {};

  // Getter untuk mengambil Set nama-nama candi favorit
  Set<String> get favorites => _favorites;

  // Getter jumlah favorit
  int get count => _favorites.length;

  // Cek apakah candi sudah difavoritkan
  bool isFavorite(String candiName) {
    return _favorites.contains(candiName);
  }

  // Toggle tambah/hapus favorit
  void toggle(String candiName) {
    if (_favorites.contains(candiName)) {
      _favorites.remove(candiName);
    } else {
      _favorites.add(candiName);
    }
    notifyListeners();
  }

  // Clear semua favorit saat sign out
  void clearAll() {
    _favorites.clear();
    notifyListeners();
  }
}
