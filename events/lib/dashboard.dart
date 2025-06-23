import 'package:events/post.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<String> imagePaths = [
    'assets/artist-3480274_1280.jpg',
    'assets/audience-1867754_1280(1).jpg',
    'assets/audio-720589_1280.jpg',
    'assets/black-and-white-4550471_1280(2).jpg',
    'assets/celebration-1852926_1280(1).jpg',
    'assets/concert-3084876_1280(1).jpg',
    'assets/dj-2250056_1280.jpg',
    'assets/music-7238254_1280(1).jpg',
    'assets/hand-1850120_1280.jpg',
    'assets/wine-8949009_1280(1).jpg',
  ];

  final List<String> titles = [
    'Artist',
    'Audience',
    'Audio',
    'Black and White',
    'Celebration',
    'Concert',
    'DJ',
    'Music',
    'Hand',
    'Wine',
  ];

  final List<String> descriptions = [
    'Artist performing on stage.',
    'Audience enjoying the event.',
    'Audio equipment setup.',
    'Black and white themed event.',
    'Celebration moment.',
    'Live concert experience.',
    'DJ mixing tracks.',
    'Music vibes.',
    'Hand in the air.',
    'Wine tasting event.',
  ];

  final List<String> usernames = [
    'artist_guru',
    'event_fan',
    'soundtech',
    'bw_photog',
    'partylover',
    'concertgoer',
    'djmax',
    'musicman',
    'handyman',
    'winelover',
  ];

  final List<String> handles = [
    '@artistguru',
    '@eventfan',
    '@soundtech',
    '@bwphotog',
    '@partylover',
    '@concertgoer',
    '@djmax',
    '@musicman',
    '@handyman',
    '@winelover',
  ];

  final List<String> times = [
    '2m',
    '5m',
    '10m',
    '15m',
    '20m',
    '25m',
    '30m',
    '35m',
    '40m',
    '45m',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 0),
            elevation: 0,
            shape: const Border(
              bottom: BorderSide(color: Colors.grey, width: 0.2),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Avatar
                  CircleAvatar(
                    backgroundColor: Colors.blue[200],
                    child: Text(
                      titles[index][0],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Tweet content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Username, handle, time
                        Row(
                          children: [
                            Text(
                              usernames[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              handles[index],
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '· ${times[index]}',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        // Tweet text
                        Text(
                          descriptions[index],
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 8),
                        // Tweet image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            imagePaths[index],
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Action icons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.comment,
                                size: 20,
                                color: Colors.grey,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.repeat,
                                size: 20,
                                color: Colors.grey,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.favorite_border,
                                size: 20,
                                color: Colors.grey,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.share,
                                size: 20,
                                color: Colors.grey,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        hoverColor: Color.fromARGB(255, 171, 217, 239),
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PostPage()),
          );
        },
      ),
    );
  }
}
