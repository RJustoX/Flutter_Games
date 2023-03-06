import 'package:flutter/material.dart';
import 'package:flutter_games/utils/app_colors.dart';
import 'package:flutter_games/utils/constants/memory_game.constants.dart';

abstract class MemoryGameFeedbackFactory extends Widget {
  factory MemoryGameFeedbackFactory(MemoryGameMode mode, MemoryGameStatus status) {
    print(status.name);
    return <MemoryGameMode, MemoryGameFeedbackFactory>{
      MemoryGameMode.normal: MemoryGameNormalFeedback(mode, status),
      MemoryGameMode.byPlays: MemoryGameNormalFeedback(mode, status),
    }[mode]!;
  }
}

class MemoryGameNormalFeedback extends StatelessWidget implements MemoryGameFeedbackFactory {
  const MemoryGameNormalFeedback(this.mode, this.result, {super.key});

  final MemoryGameMode mode;
  final MemoryGameStatus result;

  bool get won => result == MemoryGameStatus.win;

  @override
  Widget build(BuildContext context) {
    print(result.name);
    return SafeArea(
      child: Container(
        color: AppColors.bgColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                won ? 'Ganhou' : 'Perdeu',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
