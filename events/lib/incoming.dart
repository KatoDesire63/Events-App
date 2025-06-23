import 'package:events/post.dart';
import 'package:flutter/material.dart';

class IncomingPage extends StatelessWidget {
  const IncomingPage({super.key});

  // Mock data for demonstration
  final List<Map<String, String>> upcomingEvents = const [
    {
      'title': 'Live Concert',
      'desc': 'Don\'t miss the hottest concert in town!',
      'time': 'Starts in 2 hours',
      'location': 'Downtown Arena',
      'image': 'assets/concert-3084876_1280.jpg',
    },
    {
      'title': 'Wine Tasting',
      'desc': 'Experience the best local wines.',
      'time': 'Starts in 3 hours',
      'location': 'City Winery',
      'image': 'assets/wine-8949009_1280(1).jpg',
    },
    {
      'title': 'Art Exhibition',
      'desc': 'Modern art from local artists.',
      'time': 'Starts in 1 hour',
      'location': 'Art Gallery (near you)',
      'image': 'assets/artist-3480274_1280.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming Events Near You'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: upcomingEvents.length,
        itemBuilder: (context, index) {
          final event = upcomingEvents[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 20),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Image.asset(
                    event['image']!,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event['title']!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        event['desc']!,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            size: 18,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            event['time']!,
                            style: const TextStyle(color: Colors.black),
                          ),
                          const SizedBox(width: 16),
                          const Icon(
                            Icons.location_on,
                            size: 18,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            event['location']!,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PostPage(),
                            ),
                          );
                          // Action: e.g., view details or get ticket
                        },
                        icon: const Icon(Icons.event_available),
                        label: const Text('Advertise or Join'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
