import 'package:flutter/material.dart';
import 'package:flutter_games/components/memory_game/memory_game_levels.dart';
import 'package:flutter_games/components/memory_game/memory_game_logo.component.dart';
import 'package:flutter_games/utils/app_colors.dart';
import 'package:flutter_games/utils/constants/memory_game.constants.dart';

class MemoryGameHomeView extends StatefulWidget {
  const MemoryGameHomeView({super.key});

  @override
  State<MemoryGameHomeView> createState() => _MemoryGameHomeViewState();
}

class _MemoryGameHomeViewState extends State<MemoryGameHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral,
      body: SafeArea(
        child: Center(
          child: Padding(
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
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Loja'),
        BottomNavigationBarItem(icon: Icon(Icons.gamepad), label: 'Jogar'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Temas'),
      ]),
    );
  }
}
