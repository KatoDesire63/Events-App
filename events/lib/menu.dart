import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('Menu'), backgroundColor: Colors.blue),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          const Divider(),
          ListTile(
            leading: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
            title: Text(isDarkMode ? 'Dark Mode' : 'Light Mode'),
            trailing: ElevatedButton(
              onPressed: () {
                themeProvider.toggleTheme();
              },
              child: Text(isDarkMode ? 'Switch to Light' : 'Switch to Dark'),
            ),
          ),
        ],
      ),
    );
  }
}
