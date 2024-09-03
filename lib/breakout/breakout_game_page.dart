import 'package:flame/game.dart';
import 'package:flame_game_study/breakout/brick_breaker.dart';
import 'package:flame_game_study/breakout/widgets/score_card.dart';
import 'package:flutter/material.dart';

class BreakoutGamePage extends StatefulWidget {
  const BreakoutGamePage({super.key});

  @override
  State<BreakoutGamePage> createState() => _BreakoutGamePageState();
}

class _BreakoutGamePageState extends State<BreakoutGamePage> {
  late final BrickBreaker game;

  @override
  void initState() {
    super.initState();
    game = BrickBreaker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            GameWidget(
              game: game,
              overlayBuilderMap: {
                PlayState.welcome.name: (context, game) => Center(
                      child: Text(
                        'TAP TO PLAY',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                PlayState.gameOver.name: (context, game) => Center(
                      child: Text(
                        'G A M E O V E R',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                PlayState.won.name: (context, game) => Center(
                      child: Text(
                        'Y O U   W O N ! ! !',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
              },
            ),
            ScoreCard(score: game.score),
          ],
        ),
      ),
    );
  }
}
