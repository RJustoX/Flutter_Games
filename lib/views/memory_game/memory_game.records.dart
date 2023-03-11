import 'package:flutter/material.dart';
import 'package:flutter_games/repositories/memory_game.repository.dart';
import 'package:flutter_games/utils/app_colors.dart';
import 'package:flutter_games/utils/constants/memory_game.constants.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class MemoryGameRecordsView extends StatefulWidget {
  final MemoryGameMode modo;

  const MemoryGameRecordsView({Key? key, required this.modo}) : super(key: key);

  @override
  State<MemoryGameRecordsView> createState() => _MemoryGameRecordsViewState();
}

class _MemoryGameRecordsViewState extends State<MemoryGameRecordsView> {
  getModo() {
    return widget.modo == MemoryGameMode.normal ? 'Normal' : 'Desafio';
  }

  MainAxisAlignment mainAxis = MainAxisAlignment.start;

  @override
  void dispose() {
    super.dispose();
  }

  List<Widget> getRecordesList(Map recordes) {
    final List<Widget> widgets = [];

    recordes.forEach((nivel, score) {
      widgets.add(
        ListTile(
          title: Text(
            'Nível $nivel',
            style: const TextStyle(
              fontSize: 16.0,
              color: AppColors.neutral,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Text(
            score.toString(),
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: AppColors.neutral,
            ),
          ),
          tileColor: AppColors.mainColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
      );

      widgets.add(const Divider(color: Colors.transparent));
    });

    if (widgets.isEmpty) {
      widgets.add(
        Center(
          child: Text(
            'Ainda não há recordes neste modo, \n jogue uma partida ${getModo()}!',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<MemoryGameRepository>(context);

    return Scaffold(
      backgroundColor: AppColors.neutral,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
          child: Observer(
            builder: (context) => Column(
              mainAxisAlignment: mainAxis,
              children: <Widget>[
                ...getRecordesList(
                  widget.modo == MemoryGameMode.normal
                      ? repository.recordsNormal
                      : repository.recordsByPlay,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
