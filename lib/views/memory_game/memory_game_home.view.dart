import 'package:flutter/material.dart';
import 'package:flutter_games/components/memory_game/memory_game_button.component.dart';
import 'package:flutter_games/components/memory_game/memory_game_levels.dart';
import 'package:flutter_games/controllers/memory_game/memory_game.controller.dart';
import 'package:flutter_games/models/memory_game/memory_game.model.dart';
import 'package:flutter_games/utils/app_colors.dart';
import 'package:flutter_games/utils/constants/memory_game.constants.dart';
import 'package:flutter_games/views/memory_game/memory_game.view.dart';
import 'package:provider/provider.dart';

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
              children: <Widget>[
                Text(
                  'Jogo da memória'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Gilam',
                    color: AppColors.secondaryColor,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 30.0),
                  child: Text(
                    'Selecione a quantidade de cartas',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Gilam',
                      color: AppColors.secondaryColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const GameLevels(modo: MemoryGameMode.normal),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: MemoryGameButton('Temas - EM BREVE', () {}),
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
