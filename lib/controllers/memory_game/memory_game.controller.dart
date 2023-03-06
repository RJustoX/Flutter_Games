import 'package:flutter_games/models/memory_game/memory_game.model.dart';
import 'package:flutter_games/utils/constants/memory_game.constants.dart';
import 'package:mobx/mobx.dart';

part 'memory_game.controller.g.dart';

class MemoryGameController = MemoryGameControllerBase with _$MemoryGameController;

abstract class MemoryGameControllerBase with Store {
  @observable
  List<GameOption> gameCards = [];
  @observable
  int score = 0;
  @observable
  MemoryGameStatus status = MemoryGameStatus.loading;
  late GamePlay _gamePlay;
  List<GameOption> _escolha = [];
  List<Function> _escolhaCallback = [];
  int _acertos = 0;
  int _numPares = 0;
  //RecordesRepository recordesRepository;

  @computed
  bool get jogadaCompleta => (_escolha.length == 2);

  // MemoryGameControllerBase({required this.recordesRepository}) {
  //   reaction((_) => venceu == true, (bool ganhou) {
  //     if (ganhou) {
  //       recordesRepository.updateRecordes(gamePlay: _gamePlay, score: score);
  //     }
  //   });
  // }

  _chancesAcabaram() => score < _numPares - _acertos;

  _updateScore() => _gamePlay.modo == MemoryGameMode.normal ? score++ : score--;

  restartGame() => startGame(gamePlay: _gamePlay);

  _resetScore() => _gamePlay.modo == MemoryGameMode.normal ? score = 0 : score = _gamePlay.nivel;

  _resetJogada() {
    _escolha = [];
    _escolhaCallback = [];
  }

  startGame({required GamePlay gamePlay}) {
    status = MemoryGameStatus.running;
    _gamePlay = gamePlay;
    _acertos = 0;
    _numPares = (_gamePlay.nivel / 2).round();

    _resetScore();
    _generateCards();
  }

  _generateCards() {
    List<int> cardOpcoes = GameSettings.cardOpcoes.sublist(0)..shuffle();
    cardOpcoes = cardOpcoes.sublist(0, _numPares);
    gameCards = [...cardOpcoes, ...cardOpcoes]
        .map((opcao) => GameOption(opcao: opcao, matched: false, selected: false))
        .toList();
    gameCards.shuffle();
  }

  escolher(GameOption opcao, Function resetCard) async {
    opcao.selected = true;
    _escolha.add(opcao);
    _escolhaCallback.add(resetCard);
    await _compararEscolhas();
  }

  _compararEscolhas() async {
    if (jogadaCompleta) {
      if (_escolha[0].opcao == _escolha[1].opcao) {
        _acertos++;
        _escolha[0].matched = true;
        _escolha[1].matched = true;
      } else {
        await Future.delayed(const Duration(seconds: 1), () {
          for (var i in [0, 1]) {
            _escolha[i].selected = false;
            _escolhaCallback[i]();
          }
        });
      }

      _resetJogada();
      _updateScore();
      _checkGameResult();
    }
  }

  _checkGameResult() async {
    bool allMatched = _acertos == _numPares;
    if (_gamePlay.modo == MemoryGameMode.normal) {
      await _checkResultModoNormal(allMatched);
    } else {
      await _checkResultModoRound6(allMatched);
    }
  }

  _checkResultModoNormal(bool allMatched) async {
    await Future.delayed(const Duration(seconds: 1), () {
      if (allMatched) status = MemoryGameStatus.win;
    });
  }

  _checkResultModoRound6(bool allMatched) async {
    if (_chancesAcabaram()) {
      await Future.delayed(const Duration(milliseconds: 400), () => status = MemoryGameStatus.loss);
    }
    if (allMatched && score >= 0) {
      await Future.delayed(const Duration(seconds: 1), () {
        if (allMatched) status = MemoryGameStatus.win;
      });
    }
  }

  nextLevel() {
    int nivelIndex = 0;

    if (_gamePlay.nivel != GameSettings.niveis.last) {
      nivelIndex = GameSettings.niveis.indexOf(_gamePlay.nivel) + 1;
    }

    _gamePlay.nivel = GameSettings.niveis[nivelIndex];
    startGame(gamePlay: _gamePlay);
  }
}
