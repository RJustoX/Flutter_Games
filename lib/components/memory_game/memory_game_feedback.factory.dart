import 'package:flutter/material.dart';
import 'package:flutter_games/components/memory_game/memory_game_button.component.dart';
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
    return SafeArea(
      child: Container(
        width: double.maxFinite,
        color: AppColors.neutral,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 45.0),
          child: Column(
            children: [
              Text(
                won ? 'Você ganhou!' : 'Perdeu',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Gilam',
                  color: AppColors.secondaryColor,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                won ? 'Novo nível desbloqueado' : 'Você sempre pode tentar denovo',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Gilam',
                  color: AppColors.secondaryColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              MemoryGameButton('Próximo nivel', () => Navigator.of(context).pop()),
              const SizedBox(height: 10.0),
              MemoryGameButton('Voltar', () => Navigator.of(context).pop(), invertColors: true),
            ],
          ),
        ),
      ),
    );
  }
}
