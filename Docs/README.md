# TarotScore V2

Application Flutter de gestion des scores et des soirées de Tarot.

---

# Présentation

TarotScore V2 est une application multiplateforme développée avec Flutter.

Son objectif est de permettre la gestion complète de parties et de soirées de Tarot tout en offrant un moteur de calcul entièrement configurable grâce à des profils de règles.

Le projet est conçu pour être :

- simple d'utilisation
- robuste
- évolutif
- documenté
- facilement maintenable

---

# Plateformes

Actuellement supportées :

- Windows
- Android

Évolutions possibles :

- Linux
- macOS
- Web

---

# Technologies

- Flutter
- Dart
- SQLite
- sqflite
- sqflite_common_ffi

---

# Structure du projet

```
lib/
    core/
    features/

Docs/

test/

pubspec.yaml
```

---

# Documentation

Toute la documentation du projet est disponible dans le dossier **Docs**.

Ordre conseillé de lecture :

1. 00_Vision.md
2. 01_Architecture.md
3. 02_BaseDeDonnees.md
4. 03_ReglesMetier.md
5. 06_Conventions.md
6. 07_Roadmap.md
7. 08_Decisions.md
8. 09_RuleEngine.md
9. 10_RuleCatalog.md
10. 11_TestCases.md
11. 12_Fonctionnalites.md

---

# Installation

Cloner le dépôt :

```bash
git clone <url_du_depot>
```

Installer les dépendances :

```bash
flutter pub get
```

Lancer l'application :

```bash
flutter run
```

---

# Commandes utiles

Analyser le projet :

```bash
flutter analyze
```

Exécuter les tests :

```bash
flutter test
```

Mettre à jour les dépendances :

```bash
flutter pub upgrade
```

---

# Workflow de développement

Chaque fonctionnalité suit le cycle suivant :

1. Documentation
2. Conception
3. Développement
4. flutter analyze
5. Tests
6. Commit Git
7. Mise à jour de la documentation

---

# Architecture

Le projet suit une architecture **Feature First**.

Chaque fonctionnalité possède son propre module.

Le moteur de calcul est entièrement piloté par des profils de règles configurables.

Aucune règle métier n'est codée en dur lorsque celle-ci peut être exprimée comme une donnée configurable.

---

# Qualité

Avant chaque commit :

- flutter analyze doit être sans erreur
- les tests doivent être validés
- la documentation doit être à jour

---

# Licence

Projet privé.