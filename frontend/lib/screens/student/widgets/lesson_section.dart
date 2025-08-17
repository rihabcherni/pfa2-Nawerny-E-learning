import 'package:flutter/material.dart';

class LessonSection extends StatelessWidget {
  List videoList = [
    'Introduction to flutter ',
    'Installing Flutter on Windows',
    'Setup Emulator on Windows ',
    'Creating Our First App',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videoList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: index == 0
                  ? const Color.fromARGB(255, 2, 44, 141)
                  : const Color.fromARGB(255, 2, 44, 141).withOpacity(0.6),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.play_arrow_rounded,
              color: Colors.white,
              size: 25,
            ),
          ),
          title: Text(videoList[index]),
          subtitle: const Text("20 min 50 sec"),
        );
      },
    );
  }
}
