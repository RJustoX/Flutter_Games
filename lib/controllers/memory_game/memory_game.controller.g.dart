// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memory_game.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MemoryGameController on MemoryGameControllerBase, Store {
  Computed<bool>? _$jogadaCompletaComputed;

  @override
  bool get jogadaCompleta =>
      (_$jogadaCompletaComputed ??= Computed<bool>(() => super.jogadaCompleta,
              name: 'MemoryGameControllerBase.jogadaCompleta'))
          .value;

  late final _$gameCardsAtom = Atom(name: 'MemoryGameControllerBase.gameCards', context: context);

  @override
  List<GameOption> get gameCards {
    _$gameCardsAtom.reportRead();
    return super.gameCards;
  }

  @override
  set gameCards(List<GameOption> value) {
    _$gameCardsAtom.reportWrite(value, super.gameCards, () {
      super.gameCards = value;
    });
  }

  late final _$scoreAtom = Atom(name: 'MemoryGameControllerBase.score', context: context);

  @override
  int get score {
    _$scoreAtom.reportRead();
    return super.score;
  }

  @override
  set score(int value) {
    _$scoreAtom.reportWrite(value, super.score, () {
      super.score = value;
    });
  }

  late final _$venceuAtom = Atom(name: 'MemoryGameControllerBase.venceu', context: context);

  @override
  bool get won {
    _$venceuAtom.reportRead();
    return super.won;
  }

  @override
  set won(bool value) {
    _$venceuAtom.reportWrite(value, super.won, () {
      super.won = value;
    });
  }

  late final _$perdeuAtom = Atom(name: 'MemoryGameControllerBase.perdeu', context: context);

  @override
  bool get lose {
    _$perdeuAtom.reportRead();
    return super.lose;
  }

  @override
  set lose(bool value) {
    _$perdeuAtom.reportWrite(value, super.lose, () {
      super.lose = value;
    });
  }

  @override
  String toString() {
    return '''
gameCards: ${gameCards},
score: ${score},
venceu: ${won},
perdeu: ${lose},
jogadaCompleta: ${jogadaCompleta}
    ''';
  }
}
