import 'package:events/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Next Plot',
      theme: ThemeData.light(),
      home: SplashPage(key: const Key('splash_page')),
      routes: {'/home': (context) => const HomePage()},
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'), backgroundColor: Colors.blue),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 153, 201, 241),
        hoverColor: Colors.blue,
        child: Icon(Icons.add),
      ),

      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.blue,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            selectedIcon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          NavigationDestination(icon: Icon(Icons.chat_sharp), label: 'Charts'),
          NavigationDestination(
            icon: Icon(Icons.search_sharp),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications),
            label: 'Incoming',
          ),
        ],
      ),
    );
  }
}
