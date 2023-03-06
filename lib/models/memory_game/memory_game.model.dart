import 'package:flutter_games/utils/constants/memory_game.constants.dart';

class GamePlay {
  MemoryGameMode modo;
  int nivel;

  GamePlay({required this.modo, required this.nivel});
}

class GameOption {
  int opcao;
  bool matched;
  bool selected;

  GameOption({required this.opcao, required this.matched, required this.selected});
}
