import 'dart:math';

import 'package:flame_game_study/audo_control/audio_controller.dart';
import 'package:flutter/material.dart';

class AudioControlPage extends StatefulWidget {
  const AudioControlPage({
    super.key,
    required this.audioController,
  });

  final AudioController audioController;

  @override
  State<AudioControlPage> createState() => _AudioControlPageState();
}

class _AudioControlPageState extends State<AudioControlPage> {
  static const _gap = SizedBox(height: 16);

  bool filterApplied = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter SoLoud Demo', style: Theme.of(context).textTheme.bodyMedium)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              onPressed: () {
                /// random 함수 작성해줘 1~3
                final soundIndex = Random().nextInt(3) + 1;
                widget.audioController.playSound('assets/sounds/pew$soundIndex.mp3');
              },
              child: const Text('Play Sound'),
            ),
            _gap,
            OutlinedButton(
              onPressed: () {
                widget.audioController.startMusic();
              },
              child: const Text('Start Music'),
            ),
            _gap,
            OutlinedButton(
              onPressed: () {
                widget.audioController.fadeOutMusic();
              },
              child: const Text('Fade Out Music'),
            ),
            _gap,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Apply Filter'),
                Checkbox(
                  value: filterApplied,
                  onChanged: (value) {
                    setState(() {
                      filterApplied = value!;
                    });
                    if (filterApplied) {
                      widget.audioController.applyFilter();
                    } else {
                      widget.audioController.removeFilter();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
