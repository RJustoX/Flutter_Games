import 'package:flutter/cupertino.dart';
import 'package:flutter_games/utils/app_colors.dart';

class MemoryGameLogo extends StatelessWidget {
  const MemoryGameLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
