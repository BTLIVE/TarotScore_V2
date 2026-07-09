// ***************************************************************************
//
// TarotScore V2
//
// Fichier : rule_profile_service.dart
//
// Description : Accès aux profils de règles disponibles.
//
// Auteur : David
//
// ***************************************************************************

import '../factories/official_rule_profiles.dart';
import '../models/rule_profile.dart';

class RuleProfileService {
  RuleProfileService._();

  static final RuleProfileService instance =
      RuleProfileService._();

  //--------------------------------------------------------------------------
  // Liste des profils
  //--------------------------------------------------------------------------

  List<RuleProfile> getAll() {
    return OfficialRuleProfiles.all;
  }

  //--------------------------------------------------------------------------
  // Recherche par UUID
  //--------------------------------------------------------------------------

  RuleProfile? getByUuid(
    String uuid,
  ) {
    for (final profile
        in OfficialRuleProfiles.all) {
      if (profile.uuid == uuid) {
        return profile;
      }
    }

    return null;
  }

  //--------------------------------------------------------------------------
  // Vérification d'existence
  //--------------------------------------------------------------------------

  bool exists(
    String uuid,
  ) {
    return getByUuid(uuid) != null;
  }

  //--------------------------------------------------------------------------
  // Profil officiel FFT
  //--------------------------------------------------------------------------

  RuleProfile get fft =>
      OfficialRuleProfiles.fft();
}