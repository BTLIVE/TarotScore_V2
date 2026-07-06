import 'package:uuid/uuid.dart';

import 'package:tarotscore_v2/features/sessions/models/session.dart';

import 'player_factory.dart';
import 'rule_profile_factory.dart';

class SessionFactory {
  const SessionFactory._();

  static Session threePlayers({
    int firstDealerPosition = 0,
  }) {
    return Session(
      uuid: const Uuid().v4(),
      ruleProfile: RuleProfileFactory.fft(),
      players: PlayerFactory.threePlayers(),
      firstDealerPosition: firstDealerPosition,
    );
  }

  static Session fourPlayers({
    int firstDealerPosition = 0,
  }) {
    return Session(
      uuid: const Uuid().v4(),
      ruleProfile: RuleProfileFactory.fft(),
      players: PlayerFactory.fourPlayers(),
      firstDealerPosition: firstDealerPosition,
    );
  }

  static Session fivePlayers({
    int firstDealerPosition = 0,
  }) {
    return Session(
      uuid: const Uuid().v4(),
      ruleProfile: RuleProfileFactory.fft(),
      players: PlayerFactory.fivePlayers(),
      firstDealerPosition: firstDealerPosition,
    );
  }
}