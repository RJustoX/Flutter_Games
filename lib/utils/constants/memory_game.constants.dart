enum MemoryGameMode { normal, byPlays, byTime }

enum MemoryGameStatus { running, loading, win, loss }

enum GameLevel {
  level_1(1, 6),
  level_2(2, 8),
  level_3(3, 12),
  level_4(4, 14),
  level_5(5, 16),
  level_6(6, 18),
  level_7(7, 20),
  level_8(8, 24),
  level_9(9, 28),
  ;

  const GameLevel(this.level, this.cardCount);

  int get cards => cardCount;

  final int level;
  final int cardCount;
}

class GameSettings {
  static const levels = [
    GameLevel.level_1,
    GameLevel.level_2,
    GameLevel.level_3,
    GameLevel.level_4,
    GameLevel.level_5,
    GameLevel.level_6,
    GameLevel.level_7,
    GameLevel.level_8,
    GameLevel.level_9,
  ];

  static const levelsForMenu = [
    GameLevel.level_1,
    GameLevel.level_2,
    GameLevel.level_3,
    GameLevel.level_6,
    GameLevel.level_5,
    GameLevel.level_4,
    GameLevel.level_7,
    GameLevel.level_8,
    GameLevel.level_9,
  ];

  static const cardOptions = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];

  static gameBoardAxisCount(int level) => <int, int>{
        1: 3,
        2: 4,
        3: 3,
        4: 4,
        5: 4,
        6: 4,
        7: 4,
        8: 4,
        9: 4,
      }[level]!;
}
