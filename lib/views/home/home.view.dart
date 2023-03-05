import 'package:flutter/material.dart';
import 'package:flutter_games/utils/app_colors.dart';
import 'package:flutter_games/utils/app_images.dart';
import 'package:flutter_games/views/memory_game/memory_game_home.view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    double logoSize = 35.0;

    return Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: AppBar(
          backgroundColor: AppColors.secondaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox.square(
                dimension: logoSize,
                child: Image.asset(AppImages.logo),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0 + logoSize),
                child: const Text(
                  'Flutter Games',
                  style: TextStyle(
                    fontFamily: 'Gilam',
                    color: AppColors.bgColor,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(builder: (_) => const MemoryGameHomeView()),
                ),
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: AppColors.bgColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const <Widget>[
                        Text(
                          'Jogo da memória',
                          style: TextStyle(
                            fontFamily: 'Gilam',
                            color: AppColors.secondaryColor,
                            fontSize: 18.0,
                          ),
                        ),
                        Icon(
                          Icons.play_circle,
                          color: AppColors.secondaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
