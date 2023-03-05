import 'package:flutter/material.dart';
import 'package:flutter_games/components/memory_game/memory_game_button.component.dart';
import 'package:flutter_games/utils/app_colors.dart';

class MemoryGameHomeView extends StatefulWidget {
  const MemoryGameHomeView({super.key});

  @override
  State<MemoryGameHomeView> createState() => _MemoryGameHomeViewState();
}

class _MemoryGameHomeViewState extends State<MemoryGameHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50.0, 100.0, 50.0, 180.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Jogo da\nmemória'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Gilam',
                    color: AppColors.secondaryColor,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                MemoryGameButton('Jogar', () {}),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: MemoryGameButton('Temas', () {}),
                ),
                MemoryGameButton('Voltar', () => Navigator.of(context).pop()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
