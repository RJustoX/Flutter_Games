import 'package:flutter/material.dart';
import 'package:flutter_games/utils/app_colors.dart';
import 'package:flutter_games/utils/app_images.dart';

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
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
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
                  color: AppColors.fontColor,
                  fontSize: 24.0,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(color: AppColors.bgColor),
    );
  }
}
