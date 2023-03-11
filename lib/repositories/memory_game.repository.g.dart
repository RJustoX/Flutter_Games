// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memory_game.repository.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MemoryGameRepository on MemoryGameRepositoryBase, Store {
  late final _$recordsByPlayAtom =
      Atom(name: 'MemoryGameRepositoryBase.recordsByPlay', context: context);

  @override
  Map<dynamic, dynamic> get recordsByPlay {
    _$recordsByPlayAtom.reportRead();
    return super.recordsByPlay;
  }

  @override
  set recordsByPlay(Map<dynamic, dynamic> value) {
    _$recordsByPlayAtom.reportWrite(value, super.recordsByPlay, () {
      super.recordsByPlay = value;
    });
  }

  late final _$recordsNormalAtom =
      Atom(name: 'MemoryGameRepositoryBase.recordsNormal', context: context);

  @override
  Map<dynamic, dynamic> get recordsNormal {
    _$recordsNormalAtom.reportRead();
    return super.recordsNormal;
  }

  @override
  set recordsNormal(Map<dynamic, dynamic> value) {
    _$recordsNormalAtom.reportWrite(value, super.recordsNormal, () {
      super.recordsNormal = value;
    });
  }

  late final _$MemoryGameRepositoryBaseActionController =
      ActionController(name: 'MemoryGameRepositoryBase', context: context);

  @override
  dynamic loadRecordes() {
    final _$actionInfo = _$MemoryGameRepositoryBaseActionController.startAction(
        name: 'MemoryGameRepositoryBase.loadRecordes');
    try {
      return super.loadRecordes();
    } finally {
      _$MemoryGameRepositoryBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
recordsByPlay: ${recordsByPlay},
recordsNormal: ${recordsNormal}
    ''';
  }
}
