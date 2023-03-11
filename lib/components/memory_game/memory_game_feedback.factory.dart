import 'package:flutter/material.dart';
import 'package:flutter_games/components/memory_game/memory_game_button.component.dart';
import 'package:flutter_games/utils/app_colors.dart';
import 'package:flutter_games/utils/constants/memory_game.constants.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../controllers/memory_game/memory_game.controller.dart';

abstract class MemoryGameFeedbackFactory extends Widget {
  factory MemoryGameFeedbackFactory(MemoryGameMode mode, MemoryGameStatus status) {
    return <MemoryGameMode, MemoryGameFeedbackFactory>{
      MemoryGameMode.normal: MemoryGameNormalFeedback(mode, status),
      MemoryGameMode.byPlays: MemoryGameNormalFeedback(mode, status),
    }[mode]!;
  }
}

class MemoryGameNormalFeedback extends StatefulWidget implements MemoryGameFeedbackFactory {
  const MemoryGameNormalFeedback(this.mode, this.result, {super.key});

  final MemoryGameMode mode;
  final MemoryGameStatus result;

  @override
  State<MemoryGameNormalFeedback> createState() => _MemoryGameNormalFeedbackState();
}

class _MemoryGameNormalFeedbackState extends State<MemoryGameNormalFeedback> {
  late VideoPlayerController _videoController;
  bool startedPlaying = false;

  bool get won => widget.result == MemoryGameStatus.win;

  @override
  void initState() {
    super.initState();

    _videoController = VideoPlayerController.asset('assets/imgs/memory_game/win_animation.mp4');
    _videoController.addListener(() {});
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  Future<bool> started() async {
    await _videoController.initialize();
    await _videoController.play();
    startedPlaying = true;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<MemoryGameController>();
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
              FutureBuilder<bool>(
                future: started(),
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  if (snapshot.data ?? false) {
                    return AspectRatio(
                      aspectRatio: _videoController.value.aspectRatio,
                      child: VideoPlayer(_videoController),
                    );
                  } else {
                    return const Text('waiting for video to load');
                  }
                },
              ),
              const Spacer(),
              MemoryGameButton('Próximo nivel', () => controller.nextLevel()),
              const SizedBox(height: 10.0),
              MemoryGameButton('Voltar', () => Navigator.of(context).pop(), invertColors: true),
            ],
          ),
        ),
      ),
    );
  }
}
