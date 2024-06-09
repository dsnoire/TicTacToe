import 'player_enum.dart';

class Board {
  List<Player> tiles = List.generate(9, (_) => Player.none);

  bool checkWinner(Player player) {
    const winningPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    return winningPatterns
        .any((pattern) => pattern.every((index) => tiles[index] == player));
  }

  void clearTiles() {
    tiles = List.generate(9, (_) => Player.none);
  }
}
