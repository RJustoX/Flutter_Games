import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_games/components/memory_game/memory_game_feedback.factory.dart';
import 'package:flutter_games/controllers/memory_game/memory_game.controller.dart';
import 'package:flutter_games/models/memory_game/memory_game.model.dart';
import 'package:flutter_games/utils/app_colors.dart';
import 'package:flutter_games/utils/constants/memory_game.constants.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class MemoryGameView extends StatefulWidget {
  final GamePlay gamePlay;

  const MemoryGameView({Key? key, required this.gamePlay}) : super(key: key);

  @override
  State<MemoryGameView> createState() => _MemoryGameViewState();
}

class _MemoryGameViewState extends State<MemoryGameView> {
  MemoryGameController? controller;

  @override
  void didChangeDependencies() {
    controller ??= Provider.of<MemoryGameController>(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          backgroundColor: AppColors.neutral,
          appBar: controller!.status == MemoryGameStatus.running
              ? AppBar(
                  backgroundColor: AppColors.secondaryColor,
                  automaticallyImplyLeading: false,
                  title: GameScore(modo: widget.gamePlay.modo),
                )
              : null,
          body: controller!.status == MemoryGameStatus.running
              ? Center(
                  child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: GameSettings.gameBoardAxisCount(widget.gamePlay.nivel.level),
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      padding: const EdgeInsets.all(20.0),
                      children: controller!.gameCards
                          .map((GameOption go) =>
                              CardGame(widget.gamePlay.modo, go, () => setState(() {})))
                          .toList()),
                )
              : MemoryGameFeedbackFactory(widget.gamePlay.modo, controller!.status),
        );
      },
    );
  }
}

class CardGame extends StatefulWidget {
  final MemoryGameMode mode;
  final GameOption gameOpcao;

  const CardGame(this.mode, this.gameOpcao, this.callback, {super.key});

  final VoidCallback callback;
  @override
  State<CardGame> createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> with SingleTickerProviderStateMixin {
  late final AnimationController animation;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
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

  resetCard() => animation.reverse();

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
                    ? AppColors.bgColor
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
            Icon(modo == MemoryGameMode.byPlays ? Icons.my_location : Icons.touch_app_rounded),
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
