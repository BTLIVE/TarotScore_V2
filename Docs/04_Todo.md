# TODO

Projet : TarotScore V2
Document : 04_Todo.md
Version : 1.0
Date de création : 05/07/2026
Dernière mise à jour : 05/07/2026
Statut : En cours
Auteur : David & ChatGPT

---

# Historique

| Version | Date | Auteur | Description |
|----------|------|---------|-------------|
| 1.0 | 05/07/2026 | David & ChatGPT | Création du document |

---

# Objectif

Ce document constitue le tableau de bord du projet.

Il permet de suivre :

- les sprints
- les fonctionnalités
- les priorités
- l'avancement global

Il est mis à jour à la fin de chaque sprint.

---

# Légende

- [ ] À faire
- [/] En cours
- [x] Terminé

Priorités :

- P1 : Critique
- P2 : Important
- P3 : Confort
- P4 : Évolution future

---

# Avancement global

Documentation

██████████ 100 %

Architecture

██████████ 100 %

Développement

██░░░░░░░░ 20 %

Tests

░░░░░░░░░░ 0 %

---

# Sprint 1 — Gestion des joueurs

Statut : En cours

## Infrastructure

- [x] Architecture
- [x] SQLite
- [x] Navigation
- [x] Theme
- [x] Widgets communs

## Joueurs

- [x] Modèle Player
- [x] Repository
- [x] Service
- [x] Écran Liste
- [x] Formulaire

### À terminer

- [ ] Navigation Liste → Formulaire
- [ ] Création d'un joueur
- [ ] Modification
- [ ] Désactivation
- [ ] Réactivation
- [ ] Recherche
- [ ] Validation des données

---

# Sprint 2 — Profils de règles

Priorité : P1

- [ ] Modèle RuleDefinition
- [ ] Modèle RuleProfile
- [ ] Repository
- [ ] Service
- [ ] CRUD
- [ ] Sélection d'un profil
- [ ] Profil FFT

---

# Sprint 3 — Gestion des soirées

Priorité : P1

- [ ] Modèle Session
- [ ] Base SQLite
- [ ] CRUD
- [ ] Sélection des joueurs
- [ ] Sélection du profil
- [ ] Reprise d'une soirée

---

# Sprint 4 — Gestion des donnes

Priorité : P1

- [ ] Modèle Game
- [ ] Contrats
- [ ] Donneur
- [ ] Preneur
- [ ] Partenaire
- [ ] Saisie

---

# Sprint 5 — Rule Engine

Priorité : P1

- [ ] Rule Engine
- [ ] Score Calculator
- [ ] Lecture des profils
- [ ] Validation
- [ ] Tests

---

# Sprint 6 — Historique

Priorité : P2

- [ ] Historique des soirées
- [ ] Historique des donnes
- [ ] Recherche

---

# Sprint 7 — Statistiques

Priorité : P2

- [ ] Statistiques Joueurs
- [ ] Statistiques Soirées
- [ ] Graphiques
- [ ] Classements

---

# Sprint 8 — Sauvegarde

Priorité : P2

- [ ] Export
- [ ] Import
- [ ] Sauvegarde
- [ ] Restauration

---

# Évolutions futures

Priorité : P4

- [ ] Profils partagés
- [ ] Import / Export JSON
- [ ] Export PDF
- [ ] Export Excel
- [ ] Synchronisation Cloud
- [ ] Multi-utilisateurs
- [ ] Tournois
- [ ] API publique

---

# Dette technique

Aucune.

---

# Remarques

Le projet suit la règle suivante :

Documentation

↓

Conception

↓

Développement

↓

flutter analyze

↓

Tests

↓

Commit Git

↓

Mise à jour de la documentation