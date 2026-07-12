// ***************************************************************************
//
// TarotScore V2
//
// Fichier : calculation_options.dart
//
// Description : Options générales de calcul d'un profil de règles.
//
// Auteur : David
//
// ***************************************************************************

enum ScoreRoundingMode {
  exact,
  mathematical,
  floor,
  ceiling,
}

class CalculationOptions {
  //---------------------------------------------------------------------------
  // Arrondi
  //---------------------------------------------------------------------------

  /// Mode d'arrondi des scores.
  final ScoreRoundingMode roundingMode;

  //---------------------------------------------------------------------------
  // Multiplicateurs
  //---------------------------------------------------------------------------

  /// Les multiplicateurs de contrat sont appliqués.
  final bool useContractMultiplier;

  /// Les bonus sont multipliés.
  final bool multiplyBonuses;

  /// Les chelems sont multipliés.
  final bool multiplySlam;

  //---------------------------------------------------------------------------
  // Poignées
  //---------------------------------------------------------------------------

  final int simpleHandBonus;

  final int doubleHandBonus;

  final int tripleHandBonus;

  //---------------------------------------------------------------------------
  // Chelems
  //---------------------------------------------------------------------------

  final int announcedSlamBonus;

  final int failedAnnouncedSlamPenalty;

  final int unannouncedSlamBonus;

  //---------------------------------------------------------------------------
  // Divers
  //---------------------------------------------------------------------------

  final bool petitAuBoutEnabled;

  final bool misereEnabled;

  //---------------------------------------------------------------------------
  // Constructeur
  //---------------------------------------------------------------------------

  const CalculationOptions({
    this.roundingMode =
        ScoreRoundingMode.exact,

    this.useContractMultiplier = true,

    this.multiplyBonuses = false,

    this.multiplySlam = false,

    this.simpleHandBonus = 20,

    this.doubleHandBonus = 30,

    this.tripleHandBonus = 40,

    this.announcedSlamBonus = 400,

    this.failedAnnouncedSlamPenalty = -200,

    this.unannouncedSlamBonus = 200,

    this.petitAuBoutEnabled = true,

    this.misereEnabled = false,
  });

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  CalculationOptions copyWith({
    ScoreRoundingMode? roundingMode,
    bool? useContractMultiplier,
    bool? multiplyBonuses,
    bool? multiplySlam,
    int? simpleHandBonus,
    int? doubleHandBonus,
    int? tripleHandBonus,
    int? announcedSlamBonus,
    int? failedAnnouncedSlamPenalty,
    int? unannouncedSlamBonus,
    bool? petitAuBoutEnabled,
    bool? misereEnabled,
  }) {
    return CalculationOptions(
      roundingMode:
          roundingMode ??
          this.roundingMode,

      useContractMultiplier:
          useContractMultiplier ??
          this.useContractMultiplier,

      multiplyBonuses:
          multiplyBonuses ??
          this.multiplyBonuses,

      multiplySlam:
          multiplySlam ??
          this.multiplySlam,

      simpleHandBonus:
          simpleHandBonus ??
          this.simpleHandBonus,

      doubleHandBonus:
          doubleHandBonus ??
          this.doubleHandBonus,

      tripleHandBonus:
          tripleHandBonus ??
          this.tripleHandBonus,

      announcedSlamBonus:
          announcedSlamBonus ??
          this.announcedSlamBonus,

      failedAnnouncedSlamPenalty:
          failedAnnouncedSlamPenalty ??
          this.failedAnnouncedSlamPenalty,

      unannouncedSlamBonus:
          unannouncedSlamBonus ??
          this.unannouncedSlamBonus,

      petitAuBoutEnabled:
          petitAuBoutEnabled ??
          this.petitAuBoutEnabled,

      misereEnabled:
          misereEnabled ??
          this.misereEnabled,
    );
  }
}