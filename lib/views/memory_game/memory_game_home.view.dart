import 'package:flutter/material.dart';
import 'package:flutter_games/components/memory_game/memory_game_levels.dart';
import 'package:flutter_games/components/memory_game/memory_game_logo.component.dart';
import 'package:flutter_games/utils/app_colors.dart';
import 'package:flutter_games/utils/constants/memory_game.constants.dart';
import 'package:flutter_games/views/memory_game/memory_game.records.dart';
import 'package:video_player/video_player.dart';

class MemoryGameHomeView extends StatefulWidget {
  const MemoryGameHomeView({super.key});

  @override
  State<MemoryGameHomeView> createState() => _MemoryGameHomeViewState();
}

class _MemoryGameHomeViewState extends State<MemoryGameHomeView> {
  late VideoPlayerController _buttonAnimation;
  bool startedPlaying = false;

  @override
  void initState() {
    super.initState();

    _buttonAnimation = VideoPlayerController.asset('assets/imgs/memory_game/records_button.mp4');
    _buttonAnimation.addListener(() {});
  }

  @override
  void dispose() {
    _buttonAnimation.dispose();
    super.dispose();
  }

  Future<bool> started() async {
    await _buttonAnimation.initialize();
    await _buttonAnimation.play();
    startedPlaying = true;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 60.0, 50.0, 100.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const <Widget>[
                    MemoryGameLogo(),
                    GameLevels(modo: MemoryGameMode.normal),
                  ],
                ),
              ),
              Positioned(
                top: (MediaQuery.of(context).size.height / 3) - 80,
                right: 5.0,
                child: FutureBuilder<bool>(
                  future: started(),
                  builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    if (snapshot.data ?? false) {
                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) => const MemoryGameRecordsView(
                              modo: MemoryGameMode.normal,
                            ),
                          ),
                        ),
                        child: SizedBox.square(
                          dimension: 80,
                          child: VideoPlayer(_buttonAnimation),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // bottomNavigationBar: BottomNavigationBar(items: const [
      //   BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Loja'),
      //   BottomNavigationBarItem(icon: Icon(Icons.gamepad), label: 'Jogar'),
      //   BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Temas'),
      // ]),
    );
  }
}
