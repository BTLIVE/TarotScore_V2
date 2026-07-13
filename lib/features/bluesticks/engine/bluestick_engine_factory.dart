// ***************************************************************************
//
// TarotScore V2
//
// Fichier : bluestick_engine_factory.dart
//
// Description : Fabrique du moteur BlueStick.
//
// Auteur : David
//
// ***************************************************************************

import 'bluestick_engine.dart';

import 'rules/dog_bluestick_rule.dart';
import 'rules/score_bluestick_rule.dart';

class BlueStickEngineFactory {
  const BlueStickEngineFactory._();

  //--------------------------------------------------------------------------
  // Création
  //--------------------------------------------------------------------------

  static BlueStickEngine create() {
    return BlueStickEngine(
      rules: [
        ScoreBlueStickRule(),
        DogBlueStickRule(),
      ],
    );
  }
}