import 'dart:developer' as dev;

import 'package:flame_game_study/audo_control/audio_control_page.dart';
import 'package:flame_game_study/audo_control/audio_controller.dart';
import 'package:flame_game_study/breakout/breakout_game_page.dart';
import 'package:flame_game_study/game_select_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logging/logging.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  Logger.root.level = kDebugMode ? Level.FINE : Level.INFO;
  Logger.root.onRecord.listen((record) {
    dev.log(
      record.message,
      time: record.time,
      level: record.level.value,
      name: record.loggerName,
      zone: record.zone,
      error: record.error,
      stackTrace: record.stackTrace,
    );
  });

  WidgetsFlutterBinding.ensureInitialized();

  final audioController = AudioController();
  await audioController.initialize();

  runApp(
    MyApp(audioController: audioController),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.audioController,
  });

  final AudioController audioController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: '플러터 게임 공부',
      theme: ThemeData(
        textTheme: GoogleFonts.pressStart2pTextTheme().apply(
          bodyColor: const Color(0xff184e77),
          displayColor: const Color(0xff184e77),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const GameSelectPage(),
        '/breakout': (context) => const BreakoutGamePage(),
        '/audioControl': (context) => AudioControlPage(audioController: audioController),
      },
    );
  }
}
