# Conventions de développement

Projet : TarotScore V2
Document : 06_Conventions.md
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
2. Architecture
3. Nommage
4. Organisation du code
5. Documentation
6. Git
7. Développement
8. Tests
9. Documentation du projet

---

# 1. Objectifs

Ce document définit les conventions de développement utilisées pour l'ensemble du projet TarotScore V2.

L'objectif est de garantir un code homogène, lisible et facilement maintenable.

---

# 2. Architecture

Le projet suit une architecture **Feature First**.

Chaque fonctionnalité possède son propre module.

Aucune logique métier ne doit être placée dans les écrans.

Les repositories accèdent uniquement aux données.

Les services contiennent les règles métier.

---

# 3. Conventions de nommage

## Fichiers

Tous les fichiers utilisent le snake_case.

Exemples :

player.dart

player_repository.dart

player_service.dart

player_list_screen.dart

---

## Classes

Les classes utilisent le PascalCase.

Exemples :

Player

PlayerRepository

PlayerService

PlayerListScreen

---

## Variables

camelCase

Exemple :

currentSession

selectedPlayers

dealerIndex

---

## Constantes

camelCase précédé de static const lorsque possible.

---

# 4. Organisation du code

Une classe par fichier.

Une responsabilité par classe.

Les widgets réutilisables sont isolés.

Les commentaires expliquent le "pourquoi", pas le "comment".

---

# 5. Documentation

Toute fonctionnalité importante est documentée avant son développement.

Les décisions d'architecture sont enregistrées dans 08_Decisions.md.

Les règles métier sont documentées dans 03_ReglesMetier.md.

---

# 6. Git

Une fonctionnalité = un commit.

Tous les commits doivent compiler.

Le projet doit toujours respecter :

flutter analyze

sans erreur.

---

# 7. Développement

Cycle de développement :

1. Documentation
2. Conception
3. Développement
4. flutter analyze
5. Tests
6. Commit Git
7. Mise à jour de la documentation

---

# 8. Tests

Les règles de calcul devront être couvertes par des cas de test documentés.

Le moteur devra produire les résultats attendus décrits dans 11_TestCases.md.

---

# 9. Documentation

La documentation fait référence.

En cas de divergence :

- le code est corrigé ;
- ou la documentation est mise à jour.

Les deux doivent toujours rester synchronisés.