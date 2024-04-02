import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class CommunitySettingsScreen extends StatelessWidget {
  final String name;
  const CommunitySettingsScreen({super.key, required this.name});

  void navigateToSettingsScreen(BuildContext context) {
    Routemaster.of(context).push('/edit-community/:$name');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              navigateToSettingsScreen(context);
            },
          )
        ],
      ),
    );
  }
}
