// ***************************************************************************
//
// TarotScore V2
//
// Fichier : rule_profile_service.dart
//
// Description : Gestion des profils de règles.
//
// Auteur : David
//
// ***************************************************************************

import 'package:uuid/uuid.dart';

import '../factories/official_rule_profiles.dart';
import '../models/rule_profile.dart';

class RuleProfileService {
  //---------------------------------------------------------------------------
  // Singleton
  //---------------------------------------------------------------------------

  RuleProfileService._();

  static final RuleProfileService instance =
      RuleProfileService._();

  //---------------------------------------------------------------------------
  // Données
  //---------------------------------------------------------------------------

  final List<RuleProfile> _profiles = [
    OfficialRuleProfiles.fft(),
  ];

  //---------------------------------------------------------------------------
  // Lecture
  //---------------------------------------------------------------------------

  /// Retourne tous les profils.
  List<RuleProfile> getAll() =>
      List.unmodifiable(_profiles);

  /// Retourne un profil à partir de son identifiant.
  RuleProfile? get(
    String uuid,
  ) {
    for (final profile in _profiles) {
      if (profile.uuid == uuid) {
        return profile;
      }
    }

    return null;
  }

  /// Alias conservé pour compatibilité avec le code existant.
  RuleProfile? getByUuid(
    String uuid,
  ) {
    return get(uuid);
  }

  //---------------------------------------------------------------------------
  // Initialisation
  //---------------------------------------------------------------------------

  /// Remplace complètement la liste des profils.
  void replaceAll(
    Iterable<RuleProfile> profiles,
  ) {
    _profiles
      ..clear()
      ..addAll(profiles);
  }

  //---------------------------------------------------------------------------
  // Création
  //---------------------------------------------------------------------------

  /// Crée un nouveau profil.
  ///
  /// Le profil n'est pas ajouté automatiquement.
  RuleProfile create() {
    return RuleProfile(
      uuid: const Uuid().v4(),
      name: 'Nouveau profil',
      description: '',
      version: '1.0',
      official: false,
      active: true,
    );
  }

  //---------------------------------------------------------------------------
  // Écriture
  //---------------------------------------------------------------------------

  /// Enregistre un profil.
  void save(
    RuleProfile profile,
  ) {
    final index = _profiles.indexWhere(
      (element) =>
          element.uuid == profile.uuid,
    );

    if (index >= 0) {
      _profiles[index] = profile;
    } else {
      _profiles.add(profile);
    }
  }

  /// Supprime un profil.
  void delete(
    String uuid,
  ) {
    _profiles.removeWhere(
      (profile) => profile.uuid == uuid,
    );
  }

  //---------------------------------------------------------------------------
  // Duplication
  //---------------------------------------------------------------------------

  /// Duplique un profil.
  RuleProfile duplicate(
    RuleProfile profile,
  ) {
    final copy = profile.copyWith(
      uuid: const Uuid().v4(),
      name: '${profile.name} (copie)',
      official: false,
    );

    _profiles.add(copy);

    return copy;
  }
}