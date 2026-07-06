# Roadmap

Projet : TarotScore V2
Document : 07_Roadmap.md
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

# Objectif

Cette roadmap décrit les grandes étapes du développement de TarotScore V2.

Elle permet de suivre l'avancement du projet et de prioriser les développements.

Les versions correspondent à des jalons fonctionnels et non à des dates.

---

# État actuel

## Version actuelle

v2.0.0-alpha2

Statut :

✅ Terminée

---

# Phases du projet

Le développement est organisé en cinq grandes phases.

```
Fondations
        │
        ▼
Fonctionnalités principales
        │
        ▼
Moteur de règles
        │
        ▼
Statistiques
        │
        ▼
Version Stable
```

---

# Phase 1 — Fondations

Statut :

✅ Terminée

Objectifs :

- Architecture Flutter
- Architecture Feature First
- SQLite
- Navigation
- Documentation
- Git
- Base technique

Livrable :

Une application saine permettant de commencer le développement métier.

---

# Phase 2 — Gestion des données

Statut :

🟡 En cours

Objectifs :

## Joueurs

Statut : ✅ Terminé

- Création
- Modification
- Activation / Désactivation
- Validation
- Gestion des avatars
- Gestion des photos

## Profils de règles

Statut : ▶ Prochaine étape

- Création
- Modification
- Duplication
- Sélection

Livrable :

Toutes les données nécessaires sont administrables.

---

# Phase 3 — Gestion des soirées

Objectifs :

Créer une soirée.

Sélectionner les joueurs.

Sélectionner le profil de règles.

Créer les donnes.

Reprendre une soirée interrompue.

Livrable :

Une soirée complète peut être jouée.

---

# Phase 4 — Moteur de calcul

Objectifs :

Développer le Rule Engine.

Développer le Score Calculator.

Valider les calculs.

Ajouter les tests.

Livrable :

Calcul automatique des scores.

---

# Phase 5 — Historique

Objectifs :

Historique des soirées.

Historique des donnes.

Consultation.

Recherche.

---

# Phase 6 — Statistiques

Objectifs :

Statistiques des joueurs.

Statistiques des soirées.

Évolution des scores.

Classements.

---

# Phase 7 — Sauvegarde

Objectifs :

Export.

Import.

Sauvegarde.

Restauration.

---

# Phase 8 — Finitions

Objectifs :

Optimisations.

Corrections.

Tests complets.

Documentation finale.

---

# Version 2.0

Objectifs atteints :

✓ Gestion complète des joueurs

✓ Gestion des profils de règles

✓ Gestion des soirées

✓ Gestion des donnes

✓ Calcul automatique

✓ Historique

✓ Statistiques

✓ Sauvegarde

✓ Application documentée

---

# Priorités

## Priorité 1

Gestion des joueurs.

---

## Priorité 2

Profils de règles.

---

## Priorité 3

Gestion des soirées.

---

## Priorité 4

Moteur de calcul.

---

## Priorité 5

Historique.

---

## Priorité 6

Statistiques.

---

## Priorité 7

Sauvegarde.

---

# Hors périmètre Version 2.0

Les fonctionnalités suivantes ne font pas partie des objectifs de la version 2.0.

- Synchronisation Cloud
- Multi-utilisateurs
- Classements en ligne
- Tournois officiels FFT
- Intelligence artificielle
- Version Web
- API publique

Ces fonctionnalités pourront être étudiées dans une future version 3.0.

---

# Critères de validation

Une phase est considérée comme terminée lorsque :

- Toutes les fonctionnalités prévues sont développées.
- Les tests sont validés.
- `flutter analyze` ne retourne aucune erreur.
- La documentation est à jour.
- Les modifications sont validées par un commit Git.

## Prochaine étape
1. Implémentation RuleEngine
2. Persistance SQLite des profils
3. Calcul complet des manches
