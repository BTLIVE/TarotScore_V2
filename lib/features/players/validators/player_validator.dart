class PlayerValidator {
  PlayerValidator._();

  /// Nom obligatoire
  static String? validateLastName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Le nom est obligatoire.';
    }

    return null;
  }

  /// Prénom obligatoire
  static String? validateFirstName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Le prénom est obligatoire.';
    }

    return null;
  }

  /// Email facultatif mais valide si renseigné.
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }

    final regex = RegExp(
      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
    );

    if (!regex.hasMatch(value.trim())) {
      return 'Adresse e-mail invalide.';
    }

    return null;
  }

  /// Téléphone facultatif.
  static String? validateMobilePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }

    final regex = RegExp(r'^[0-9 +().-]{6,20}$');

    if (!regex.hasMatch(value.trim())) {
      return 'Numéro invalide.';
    }

    return null;
  }
}