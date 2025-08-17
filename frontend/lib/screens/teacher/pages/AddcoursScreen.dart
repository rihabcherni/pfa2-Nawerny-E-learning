import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pfa_frontend/models/teacher/cours.dart';
import 'package:pfa_frontend/screens/teacher/pages/contentScreen.dart';
import 'package:pfa_frontend/utils/setting_provider.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:audioplayers/audioplayers.dart';

class AddCoursScreen extends StatefulWidget {
  const AddCoursScreen({Key? key}) : super(key: key);

  @override
  _AddCoursScreenState createState() => _AddCoursScreenState();
}

class _AddCoursScreenState extends State<AddCoursScreen> {
  final _formKey = GlobalKey<FormState>();

  late String _title;
  late String _description;
  Uint8List? _imageBytes; 
  late XFile _videoFile;
  VideoPlayerController? _videoController; 
  late String? _audioPath; 
  List<Content> _contents = [];
  final picker = ImagePicker();
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.network('');
  }

  @override
  void dispose() {
    _videoController!.dispose();
    super.dispose();
  }

  void _addContent(Content content) {
    setState(() {
      _contents.add(content);
    });
  }

  void _selectImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = imageBytes;
      });
    }
  }

  Future<void> _selectVideo() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _videoFile = pickedFile;
        _videoController!.dispose(); 
        _videoController = VideoPlayerController.file(File(_videoFile.path))
          ..initialize().then((_) {
            setState(() {});
          });
      });
    }
  }

  void _recordAudio() async {
    _audioPath = 'path_to_recorded_audio';
  }

  void _saveCourse() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();
    setState(() {
      _title = '';
      _description = '';
      _imageBytes = null;
      _videoController!.dispose();
      _videoController = VideoPlayerController.network('');
      _audioPath = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Course'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Course Title',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _title = value!;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Sub Title',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a sub title';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _description = value!;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _selectImage,
                  child: Text('Select Image'),
                ),
                SizedBox(height: 20),
                if (_imageBytes != null) 
                  Image.memory(_imageBytes!),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _selectVideo,
                  child: Text('Select Video'),
                ),
                SizedBox(height: 20),
                if (_videoController != null &&
                    _videoController!.value.isInitialized)
                  AspectRatio(
                    aspectRatio: _videoController!.value.aspectRatio,
                    child: VideoPlayer(_videoController!),
                  ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _recordAudio,
                  child: Text('Record Audio'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContentScreen(
                          onContentAdded: _addContent,
                        ),
                      ),
                    );
                  },
                  child: Text('Add Content'),
                ),
                SizedBox(height: 20),
                if (_contents.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contents:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: context
                              .watch<SettingsProvider>()
                              .settings
                              .smallTextSize,
                        ),
                      ),
                      for (var content in _contents)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text('Title: ${content.titre}'),
                            Text('Description: ${content.description}'),
                            Divider(),
                          ],
                        ),
                    ],
                  ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _saveCourse,
                  child: Text('Save Course'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
