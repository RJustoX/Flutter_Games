import 'package:flutter/material.dart';
import 'package:flutter_games/controllers/memory_game/memory_game.controller.dart';
import 'package:flutter_games/models/memory_game/memory_game.model.dart';
import 'package:flutter_games/utils/app_colors.dart';
import 'package:flutter_games/utils/constants/memory_game.constants.dart';
import 'package:flutter_games/views/memory_game/memory_game.view.dart';
import 'package:provider/provider.dart';

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

class CardNivel extends StatelessWidget {
  final GamePlay gamePlay;

  const CardNivel({Key? key, required this.gamePlay}) : super(key: key);

  startGame(BuildContext context) {
    context.read<MemoryGameController>().startGame(gamePlay: gamePlay);

    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) => MemoryGameView(gamePlay: gamePlay),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => startGame(context),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: 90,
        height: 90,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: gamePlay.modo == MemoryGameMode.normal
                ? AppColors.secondaryColor
                : AppColors.bgColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color:
              gamePlay.modo == MemoryGameMode.normal ? AppColors.neutral : AppColors.secondaryColor,
        ),
        child: Center(
          child: Text(
            gamePlay.nivel.toString(),
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
              fontFamily: 'Gilam',
              color: AppColors.secondaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
