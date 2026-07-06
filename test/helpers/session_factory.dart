import 'package:uuid/uuid.dart';

import 'package:tarotscore_v2/features/sessions/models/session.dart';

import 'player_factory.dart';
import 'rule_profile_factory.dart';

class SessionFactory {
  const SessionFactory._();

  static Session threePlayers() {
    return Session(
      uuid: const Uuid().v4(),
      ruleProfile: RuleProfileFactory.fft(),
      players: PlayerFactory.threePlayers(),
    );
  }

  static Session fourPlayers() {
    return Session(
      uuid: const Uuid().v4(),
      ruleProfile: RuleProfileFactory.fft(),
      players: PlayerFactory.fourPlayers(),
    );
  }

  static Session fivePlayers() {
    return Session(
      uuid: const Uuid().v4(),
      ruleProfile: RuleProfileFactory.fft(),
      players: PlayerFactory.fivePlayers(),
    );
  }
}