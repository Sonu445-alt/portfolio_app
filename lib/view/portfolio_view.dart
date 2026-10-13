import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_app/viewmodel/portfolio_viewmodel.dart';

class PortfolioView extends StatelessWidget {
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PortfolioViewModel>();
    final profile = vm.profile;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
        actions: [
          IconButton(
            onPressed: vm.toggleTheme,
            icon: Icon(
              vm.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blue.shade100,
              child: ClipOval(
                child: Image.asset('assets/image/image.jpeg', fit: BoxFit.cover, width: 120, height: 120),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              const Text(
                'Santosh Kumar Rajak',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                profile.role,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          const SizedBox(height: 28),
          const Text(
            'About Me',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'I am a Flutter developer interested in building mobile applications using Flutter, Dart, Firebase and Rest APIs.',
          ),
          const SizedBox(height: 24),
          const Text(
            'My Skills',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: profile.skills.map((skill) {
              return Chip(label: Text(skill));
            }).toList(),
          ),
          const SizedBox(height: 24),
          const Text(
            'My Projects',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ...profile.projects.map((project) {
            return Card(
              child: ListTile(
                leading: const Icon(Icons.code),
                title: Text(project),
                subtitle: const Text('Flutter Project'),
              ),
            );
          }),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Education',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 10),

          const Card(
            child: ListTile(
              leading: Icon(Icons.school),
              title: Text('B.Tech CSE'),
              subtitle: Text('Computer Science Engineering'),
            ),
          ),

          const SizedBox(height: 30),
          const SizedBox(height: 24),
          const Text(
            'Contact Me',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.email),
            title: const Text('Email'),
            subtitle: Text(profile.email),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon (Icons.phone),
            title: const Text('Phone'),
            subtitle: const Text('7080315030'),
          ),
        ],
      ),
    );
  }
}
