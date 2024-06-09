import 'package:flutter/material.dart';
import 'package:tictactoe/player_extension.dart';

import 'board.dart';
import 'player_enum.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({
    Key? key,
  }) : super(key: key);

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  final Board board = Board();
  Player player = Player.X;
  int playerXPoints = 0;
  int playerOPoints = 0;

  void onTileTap(int index) {
    if (board.tiles[index] != Player.none) return;
    setState(() {
      board.tiles[index] = player;
      if (board.checkWinner(player)) {
        showGameOverDialog('${player.symbol} wins!');
        board.clearTiles();
        player == Player.X ? playerXPoints++ : playerOPoints++;
      } else if (board.tiles.every((tile) => tile != Player.none)) {
        showGameOverDialog("It's a draw!");
        board.clearTiles();
      } else {
        player = player == Player.X ? Player.O : Player.X;
      }
    });
  }

  void resetGame() {
    setState(() {
      board.clearTiles();
      playerXPoints = 0;
      playerOPoints = 0;
    });
  }

  void showGameOverDialog(String content) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Game over!'),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Play again'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Tic Tac Toe',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 29,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => resetGame(),
            icon: const Icon(Icons.restart_alt),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'X',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F0F0F),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 34,
                  ),
                  child: Text(
                    '$playerXPoints - $playerOPoints',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'O',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: board.tiles.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 6,
                crossAxisSpacing: 6,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => onTileTap(index),
                  child: Container(
                    color: const Color(0xFF0F0F0F),
                    child: Center(
                      child: Text(
                        board.tiles[index].symbol,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 52,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
