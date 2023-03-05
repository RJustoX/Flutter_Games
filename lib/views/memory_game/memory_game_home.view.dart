import 'package:flutter/material.dart';

class MemoryGameHomeView extends StatefulWidget {
  const MemoryGameHomeView({super.key});

  @override
  State<MemoryGameHomeView> createState() => _MemoryGameHomeViewState();
}

class _MemoryGameHomeViewState extends State<MemoryGameHomeView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(child: Text('Jogo da memória')),
      ),
    );
  }
}
