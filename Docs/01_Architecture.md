# Architecture

Projet : TarotScore V2
Document : 01_Architecture.md
Version : 1.0
Date de création : 05/07/2026
Dernière mise à jour : 05/07/2026
Statut : Validé
Auteur : David & ChatGPT

---

# Historique

| Version | Date | Auteur | Description |
|----------|------|---------|-------------|
| 1.0 | 05/07/2026 | David & ChatGPT | Création du document |

---

# Sommaire

1. Objectifs
2. Architecture générale
3. Organisation des dossiers
4. Modules
5. Flux des dépendances
6. Règles de développement
7. Cycle de vie d'une fonctionnalité
8. Évolutions prévues

---

# 1. Objectifs

L'architecture de TarotScore V2 a été conçue pour être :

- simple à comprendre
- modulaire
- facilement maintenable
- évolutive
- testable

Chaque fonctionnalité doit pouvoir évoluer indépendamment des autres.

---

# 2. Architecture générale

Le projet est organisé selon une architecture **Feature First**.

Chaque fonctionnalité possède son propre module.

L'infrastructure commune est regroupée dans le dossier `core`.

```
lib/
│
├── core/
└── features/
```

---

# 3. Organisation des dossiers

## core

Le dossier `core` contient tout ce qui est partagé par l'ensemble de l'application.

```
core/
│
├── constants/
├── database/
├── exceptions/
├── extensions/
├── logger/
├── router/
├── theme/
├── utils/
└── widgets/
```

### Responsabilités

- base SQLite
- navigation
- thème
- widgets communs
- outils utilitaires

Le dossier `core` ne contient aucune logique métier.

---

## features

Chaque fonctionnalité possède son propre dossier.

Exemple :

```
players/
│
├── models/
├── repositories/
├── screens/
├── services/
└── widgets/
```

Tous les modules respecteront cette structure.

---

# 4. Modules actuels

## Home

Responsabilité :

- écran d'accueil
- accès aux fonctionnalités

---

## Players

Responsabilité :

- gestion des joueurs
- création
- modification
- désactivation

---

## Sessions

Responsabilité :

- gestion des soirées

À développer.

---

## Games

Responsabilité :

- gestion des donnes

À développer.

---

## Statistics

Responsabilité :

- statistiques des joueurs

À développer.

---

## Settings

Responsabilité :

- paramètres de l'application

À développer.

---

## About

Responsabilité :

- informations sur l'application

À développer.

---

# 5. Flux des dépendances

Toutes les dépendances suivent la même direction.

```
Screen
    │
    ▼
Service
    │
    ▼
Repository
    │
    ▼
SQLite
```

Une couche ne peut jamais dépendre d'une couche supérieure.

---

# 6. Responsabilités

## Screen

Affiche l'interface utilisateur.

Ne contient aucune logique métier.

---

## Service

Contient les règles métier.

Ne connaît pas SQLite.

---

## Repository

Accède uniquement aux données.

Ne contient aucune règle métier.

---

## Database

Responsable uniquement de la persistance.

---

# 7. Règles de développement

Chaque classe possède une seule responsabilité.

Les écrans n'accèdent jamais directement à SQLite.

Les repositories ne contiennent jamais de logique métier.

Les services sont les seuls à manipuler les règles de gestion.

Les widgets réutilisables sont placés dans `core/widgets` ou dans le module concerné.

---

# 8. Cycle de vie d'une fonctionnalité

Chaque nouvelle fonctionnalité suit les étapes suivantes :

1. Documentation
2. Modèle
3. Base de données
4. Repository
5. Service
6. Interface utilisateur
7. Tests
8. Documentation
9. Commit Git

---

# 9. Architecture actuelle

```
lib/
│
├── core/
│   ├── constants/
│   ├── database/
│   ├── exceptions/
│   ├── extensions/
│   ├── logger/
│   ├── router/
│   ├── theme/
│   ├── utils/
│   └── widgets/
│
├── features/
│   ├── about/
│   ├── games/
│   ├── home/
│   ├── players/
│   ├── sessions/
│   ├── settings/
│   └── statistics/
│
├── main.dart
└── tarot_score_app.dart
```

---

# 10. Évolutions prévues

Les modules suivants seront développés :

- gestion des soirées
- moteur de calcul du Tarot
- historique
- statistiques avancées
- sauvegarde/restauration
- export des résultats

L'architecture actuelle permet d'ajouter ces fonctionnalités sans remise en cause des modules existants.