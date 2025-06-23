import 'package:events/dashboard.dart';
import 'package:flutter/material.dart';
import 'auth.dart';
import 'chart.dart';
import 'incoming.dart';
import 'post.dart';
import 'search.dart';
import 'splash.dart';

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
      routes: {'/home': (context) => const AuthPage()},
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});
  static const String routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;

  Widget _getSelectedPage() {
    switch (_selectedPage) {
      case 0:
        return const DashboardPage();
      case 1:
        return const ChartPage();
      case 2:
        return const SearchPage();
      case 3:
        return const IncomingPage();
      default:
        return const PostPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''), backgroundColor: Colors.blue),
      body: _getSelectedPage(),

      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.blue,
        selectedIndex: _selectedPage,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
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
