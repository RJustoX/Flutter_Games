import 'package:flutter_games/utils/constants/memory_game.constants.dart';

class GamePlay {
  Modo modo;
  int nivel;

  GamePlay({required this.modo, required this.nivel});
}

class GameOpcao {
  int opcao;
  bool matched;
  bool selected;

  GameOpcao({required this.opcao, required this.matched, required this.selected});
}
