import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  bool _isSignedIn = false;
  String _username = '';

  bool get isSignedIn => _isSignedIn;
  String get username => _username;

  void signIn(String username) {
    _isSignedIn = true;
    _username = username;
    notifyListeners();
  }

  void signOut() {
    _isSignedIn = false;
    _username = '';
    notifyListeners();
  }
}