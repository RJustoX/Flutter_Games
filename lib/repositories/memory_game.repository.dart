import 'package:flutter/cupertino.dart';
import 'package:flutter_games/models/memory_game/memory_game.model.dart';
import 'package:flutter_games/utils/constants/memory_game.constants.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

part 'memory_game.repository.g.dart';

class MemoryGameRepository = MemoryGameRepositoryBase with _$MemoryGameRepository;

abstract class MemoryGameRepositoryBase with Store {
  late final Box _recordes;
  late final GamePlay gamePlay;
  @observable
  Map recordsByPlay = {};
  @observable
  Map recordsNormal = {};

  MemoryGameRepositoryBase() {
    _initRepository();
  }

  _initRepository() async {
    await _initDatabase();
    await loadRecordes();
  }

  _initDatabase() async {
    _recordes = await Hive.openBox('memoryGameRecordes');
  }

  @action
  loadRecordes() {
    recordsNormal = _recordes.get(MemoryGameMode.normal.name) ?? {};
    recordsByPlay = _recordes.get(MemoryGameMode.byPlays.name) ?? {};

    debugPrint(recordsNormal.toString());
  }

  updateRecordes({required GamePlay gamePlay, required int score}) {
    final key = gamePlay.modo.name;

    if (gamePlay.modo == MemoryGameMode.normal &&
        (recordsNormal[gamePlay.nivel.cards] == null ||
            score < recordsNormal[gamePlay.nivel.cards])) {
      recordsNormal[gamePlay.nivel.level] = score;
      _recordes.put(key, recordsNormal);
    } else if (gamePlay.modo == MemoryGameMode.byPlays &&
        (recordsByPlay[gamePlay.nivel] == null || score > recordsByPlay[gamePlay.nivel])) {
      recordsByPlay[gamePlay.nivel] = score;
      _recordes.put(key, recordsByPlay);
    }
  }
}
