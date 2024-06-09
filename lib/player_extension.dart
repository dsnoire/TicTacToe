import 'player_enum.dart';

extension PlayerExtension on Player {
  String get symbol {
    switch (this) {
      case Player.X:
        return 'X';

      case Player.O:
        return 'O';

      case Player.none:
      default:
        return '';
    }
  }
}
