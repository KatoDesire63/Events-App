import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final TextEditingController _eventController = TextEditingController();
  File? _pickedImage;
  File? _pickedVideo;

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null && result.files.single.path != null) {
      setState(() {
        _pickedImage = File(result.files.single.path!);
      });
    }
  }

  Future<void> _pickVideo() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);
    if (result != null && result.files.single.path != null) {
      setState(() {
        _pickedVideo = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advertise Event'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _eventController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Describe your event',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: _pickImage,
                    icon: const Icon(Icons.image),
                    label: const Text('Add Image/Flyer'),
                  ),
                  ElevatedButton.icon(
                    onPressed: _pickVideo,
                    icon: const Icon(Icons.videocam),
                    label: const Text('Add Video'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (_pickedImage != null)
                Column(
                  children: [
                    const Text(
                      'Selected Image:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Image.file(File(_pickedImage!.path), height: 180),
                  ],
                ),
              if (_pickedVideo != null)
                Column(
                  children: [
                    const SizedBox(height: 16),
                    const Text(
                      'Selected Video:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Icon(Icons.videocam, size: 80, color: Colors.blue),
                    Text(_pickedVideo!.path.split(Platform.pathSeparator).last),
                  ],
                ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Handle post submission logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Event advertised!')),
                  );
                  _eventController.clear();
                  setState(() {
                    _pickedImage = null;
                    _pickedVideo = null;
                  });
                },
                child: const Text('Post Event'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
