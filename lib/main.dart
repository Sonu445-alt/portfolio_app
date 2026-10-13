import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_app/view/portfolio_view.dart';
import 'package:portfolio_app/viewmodel/portfolio_viewmodel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => PortfolioViewModel(),
      child: const PortfolioApp(),
    ),
  );
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Rebuild only when `isDarkMode` changes
    final isDarkMode = context.select<PortfolioViewModel, bool>(
          (vm) => vm.isDarkMode,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portfolio',

      // Light Theme configuration
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),

      // Dark Theme configuration
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),

      // Theme toggle mode
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,

      home: const PortfolioView(),
    );
  }
}