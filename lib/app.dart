import 'package:flutter/material.dart';

import 'tictactoe.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
          background: const Color(0xFF0C0C0C),
        ),
        useMaterial3: true,
      ),
      home: const TicTacToe(),
    );
  }
}
