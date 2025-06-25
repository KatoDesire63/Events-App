import 'package:events/post.dart';
import 'package:flutter/material.dart';
import 'package:random_person_data/random_person_data.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<String> imagePaths = [
    'assets/pic1.jpg',
    'assets/pic2.jpg',
    'assets/pic3.jpg',
    'assets/pic4.jpg',
    'assets/pic5.jpg',
    'assets/pic6.jpg',
    'assets/pic7.jpg',
    'assets/pic8.jpg',
    'assets/pic9.jpg',
    'assets/pic10.jpg',
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

  //Using Random User Generator API
  List<RandomPersonData> persons = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRandomPerson();
  }

  Future<void> fetchRandomPerson() async {
    final randomPerson = RandomPerson();
    final fetchedPersons = await randomPerson.get(
      results: 10,
      gender: Gender.male,
      password: "special,upeer,lower,number",
      nationality: Nationality.US,
    );

    setState(() {
      persons = fetchedPersons;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      body: ListView.builder(
        itemCount: persons.length,
        itemBuilder: (context, index) {
          final person = persons[index];
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
                    backgroundImage: NetworkImage(
                      person.picture?.large ??
                          'https://via.placeholder.com/150',
                    ),
                    backgroundColor: Colors.blue[200],
                  ),
                  const SizedBox(width: 12),
                  // Tweet content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Username, nationality, time
                        Row(
                          children: [
                            Text(
                              '${person.name?.first ?? ''} ${person.name?.last ?? ''}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              (person.nat ?? '').toString(),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '· ${times[index % times.length]}',
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
                          descriptions[index % descriptions.length],
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 8),
                        // Tweet image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            imagePaths[index % imagePaths.length],
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
        hoverColor: const Color.fromARGB(255, 171, 217, 239),
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
