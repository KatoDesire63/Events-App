import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> searchResults = [
    'club',
    'concert',
    'event',
    'festival',
    'party',
    'live music',
    'DJ',
    'performance',
    'gathering',
    'nightlife',
    'entertainment',
    'social event',
    'community event',
    'cultural event',
    'themed party',
  ];
  List<String> filteredResults = [];

  @override
  void initState() {
    super.initState();
    // Initialize filtered results with all search results
    filteredResults = List.from(searchResults);
  }

  void _filterResults(String query) {
    setState(() {
      filteredResults = searchResults
          .where((result) => result.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                _filterResults(value);
              },
              onSubmitted: (value) {
                _filterResults(value);
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredResults.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(filteredResults[index]));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
