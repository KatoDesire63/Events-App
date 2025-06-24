import 'package:events/dashboard.dart';
import 'package:events/menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'auth.dart';
import 'chart.dart';
import 'incoming.dart';
import 'post.dart';
import 'search.dart';
import 'splash.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Next Plot',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.themeMode,
      home: SplashPage(key: const Key('splash_page')),
      routes: {'/home': (context) => const AuthPage()},
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;

  AppBar _getAppBar() {
    switch (_selectedPage) {
      case 0:
        return AppBar(
          title: const Text('Dashboard'),
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MenuPage()),
              );
            },
          ),
        );
      case 1:
        return AppBar(
          title: const Text('Charts'),
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MenuPage()),
              );
            },
          ),
        );
      case 2:
        return AppBar(
          title: const Text('Search'),
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MenuPage()),
              );
            },
          ),
        );
      case 3:
        return AppBar(
          title: const Text('Incoming'),
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MenuPage()),
              );
            },
          ),
        );
      default:
        return AppBar(
          title: const Text('Posts'),
          backgroundColor: Colors.blue,
          leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        );
    }
  }

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
      appBar: _getAppBar(),
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
