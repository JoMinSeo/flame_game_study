import 'package:flame_game_study/routes/routes.dart';
import 'package:flutter/material.dart';

class GameSelectPage extends StatelessWidget {
  const GameSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(20),
          itemBuilder: (context, index) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () => Navigator.pushNamed(context, routes[index]),
              child: Text(routes[index]),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemCount: routes.length,
        ),
      ),
    );
  }
}
