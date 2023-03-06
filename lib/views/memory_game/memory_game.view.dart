import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_games/components/memory_game/memory_game_button.component.dart';
import 'package:flutter_games/controllers/memory_game/memory_game.controller.dart';
import 'package:flutter_games/models/memory_game/memory_game.model.dart';
import 'package:flutter_games/utils/app_colors.dart';
import 'package:flutter_games/utils/constants/memory_game.constants.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class MemoryGameView extends StatelessWidget {
  final GamePlay gamePlay;

  const MemoryGameView({Key? key, required this.gamePlay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MemoryGameController controller = Provider.of<MemoryGameController>(context);

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        automaticallyImplyLeading: false,
        title: GameScore(modo: gamePlay.modo),
      ),
      body: Observer(
        builder: (_) {
          if (controller.won) {
            return const MemoryGameFeedback(result: MemoryGameResult.win);
          } else if (controller.lose) {
            return const MemoryGameFeedback(result: MemoryGameResult.loss);
          } else {
            return Center(
              child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: GameSettings.gameBoardAxisCount(gamePlay.nivel),
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  padding: const EdgeInsets.all(20.0),
                  children: controller.gameCards
                      .map((GameOption go) => CardGame(mode: gamePlay.modo, gameOpcao: go))
                      .toList()),
            );
          }
        },
      ),
    );
  }
}

class MemoryGameFeedback extends StatelessWidget {
  final MemoryGameResult result;

  const MemoryGameFeedback({Key? key, required this.result}) : super(key: key);

  String getResultado() => result == MemoryGameResult.win ? 'Muito bem!' : 'Não foi dessa vez!';

  @override
  Widget build(BuildContext context) {
    final controller = context.read<MemoryGameController>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            getResultado(),
            style: const TextStyle(fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Image.asset(
              'assets/imgs/memory_game/${result == MemoryGameResult.win ? 'aprovado' : 'eliminado'}.png',
              scale: 2.0,
            ),
          ),
          result == MemoryGameResult.loss
              ? MemoryGameButton(
                  'Tentar novamente',
                  () => controller.restartGame(),
                )
              : MemoryGameButton(
                  'Próximo Nível',
                  () => controller.nextLevel(),
                )
        ],
      ),
    );
  }
}

class CardGame extends StatefulWidget {
  final MemoryGameMode mode;
  final GameOption gameOpcao;

  const CardGame({Key? key, required this.mode, required this.gameOpcao}) : super(key: key);

  @override
  State<CardGame> createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> with SingleTickerProviderStateMixin {
  late final AnimationController animation;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  AssetImage getImage(double angulo) {
    if (angulo > 0.5 * pi) {
      return AssetImage('assets/imgs/memory_game/${widget.gameOpcao.opcao.toString()}.png');
    } else {
      return widget.mode == MemoryGameMode.normal
          ? const AssetImage('assets/imgs/memory_game/card_normal.png')
          : const AssetImage('assets/imgs/memory_game/card_round.png');
    }
  }

  flipCard() {
    final game = context.read<MemoryGameController>();

    if (!animation.isAnimating &&
        !widget.gameOpcao.matched &&
        !widget.gameOpcao.selected &&
        !game.jogadaCompleta) {
      animation.forward();
      game.escolher(widget.gameOpcao, resetCard);
    }
  }

  resetCard() {
    animation.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, _) {
        final angulo = animation.value * pi;
        final transform = Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateY(angulo);

        return GestureDetector(
          onTap: () => flipCard(),
          child: Transform(
            transform: transform,
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                color: widget.mode == MemoryGameMode.normal
                    ? AppColors.mainColor
                    : AppColors.secondaryColor,
                border: Border.all(
                  color: widget.mode == MemoryGameMode.normal
                      ? AppColors.secondaryColor
                      : AppColors.mainColor,
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(fit: BoxFit.fill, image: getImage(angulo)),
              ),
            ),
          ),
        );
      },
    );
  }
}

class GameScore extends StatelessWidget {
  final MemoryGameMode modo;
  const GameScore({Key? key, required this.modo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MemoryGameController>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(modo == MemoryGameMode.chalenge ? Icons.my_location : Icons.touch_app_rounded),
            const SizedBox(width: 10),
            Observer(
                builder: (_) =>
                    Text(controller.score.toString(), style: const TextStyle(fontSize: 25))),
          ],
        ),
        TextButton(
          child: const Text(
            'Sair',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
