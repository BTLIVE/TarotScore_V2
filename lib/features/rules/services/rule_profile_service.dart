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

import '../factories/rule_profile_factory.dart';
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

  final List<RuleProfile> _profiles = [];

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

  /// Alias temporaire conservé pour compatibilité
  /// avec le sérialiseur actuel.
  RuleProfile? getByUuid(
    String uuid,
  ) {
    return get(uuid);
  }

  //---------------------------------------------------------------------------
  // Création
  //---------------------------------------------------------------------------

  /// Crée un nouveau profil.
  ///
  /// Le profil n'est pas enregistré automatiquement.
  RuleProfile create() {
    return RuleProfileFactory.create(
      name: 'Nouveau profil',
    );
  }

  //---------------------------------------------------------------------------
  // Sauvegarde
  //---------------------------------------------------------------------------

  /// Ajoute ou met à jour un profil.
  void save(
    RuleProfile profile,
  ) {
    final index = _profiles.indexWhere(
      (item) => item.uuid == profile.uuid,
    );

    if (index >= 0) {
      _profiles[index] = profile;
    } else {
      _profiles.add(profile);
    }
  }

  //---------------------------------------------------------------------------
  // Suppression
  //---------------------------------------------------------------------------

  /// Supprime un profil.
  void delete(
    String uuid,
  ) {
    _profiles.removeWhere(
      (profile) => profile.uuid == uuid,
    );
  }

  //---------------------------------------------------------------------------
  // Initialisation / Restauration
  //---------------------------------------------------------------------------

  /// Remplace complètement la liste des profils.
  ///
  /// Utilisé lors du chargement depuis le stockage.
  void replaceAll(
    Iterable<RuleProfile> profiles,
  ) {
    _profiles
      ..clear()
      ..addAll(profiles);
  }
}