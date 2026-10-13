import 'package:flutter/material.dart';
import 'package:portfolio_app/model/profile.dart';

class PortfolioViewModel extends ChangeNotifier {
  final Profile _profile;
  bool _isDarkMode = false;

  PortfolioViewModel({Profile? initialProfile})
      : _profile = initialProfile ??
      const Profile(
        name: 'Santosh Kumar Rajak',
        qualification:  'B.Tech CSE',
        role: 'Flutter App Developer',
        email: 'santosh.mac2019@gmail.com',
        skills: [
          'Flutter',
          'Dart',
          'REST API',
          'MVVM Architecture',
          'Provider',
          'GitHub',
        ],
        projects: [
          'E-Commerce App',
          'Personal Portfolio App',
        ],
      );

  // Read-only getters
  Profile get profile => _profile;
  bool get isDarkMode => _isDarkMode;

  /// Toggles between Light Mode and Dark Mode
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}