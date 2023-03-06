import 'package:flutter/material.dart';
import 'package:flutter_games/models/memory_game/memory_game.model.dart';
import 'package:flutter_games/utils/constants/memory_game.constants.dart';
import 'package:flutter_games/views/memory_game/memory_game_home.view.dart';

class GameLevels extends StatelessWidget {
  final MemoryGameMode modo;

  const GameLevels({Key? key, required this.modo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final niveis = GameSettings.niveis
        .map((n) => CardNivel(gamePlay: GamePlay(modo: modo, nivel: n)))
        .toList();

    return Flexible(
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: niveis,
      ),
    );
  }
}
