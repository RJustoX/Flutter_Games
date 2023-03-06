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

  late final _$gameCardsAtom =
      Atom(name: 'MemoryGameControllerBase.gameCards', context: context);

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

  late final _$scoreAtom =
      Atom(name: 'MemoryGameControllerBase.score', context: context);

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

  late final _$statusAtom =
      Atom(name: 'MemoryGameControllerBase.status', context: context);

  @override
  MemoryGameStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(MemoryGameStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  @override
  String toString() {
    return '''
gameCards: ${gameCards},
score: ${score},
status: ${status},
jogadaCompleta: ${jogadaCompleta}
    ''';
  }
}
