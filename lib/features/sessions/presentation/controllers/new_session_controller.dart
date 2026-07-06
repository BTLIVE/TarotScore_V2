import '../../../players/models/player.dart';
import '../../../rules/models/rule_profile.dart';

class NewSessionController {
  RuleProfile? selectedProfile;

  final List<Player> selectedPlayers = [];

  int firstDealerPosition = 0;

  bool isSelected(Player player) {
    return selectedPlayers.contains(player);
  }

  void togglePlayer(Player player) {
    if (isSelected(player)) {
      selectedPlayers.remove(player);
    } else {
      selectedPlayers.add(player);
    }
  }

  bool get canCreate =>
      selectedPlayers.length == 4 ||
      selectedPlayers.length == 5;
}