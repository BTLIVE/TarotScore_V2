# TarotScore V2

Version du document : 1.0
Dernière mise à jour : 05/07/2026

---

# Vision

TarotScore V2 est une application Flutter permettant de gérer des soirées de Tarot de manière simple, fiable et moderne.

L'application doit permettre de remplacer totalement les feuilles de score papier tout en offrant des fonctionnalités avancées impossibles à réaliser manuellement.

L'objectif n'est pas seulement de calculer les scores, mais de gérer l'ensemble de la vie d'une soirée de Tarot.

---

# Objectifs

L'application doit permettre de :

- gérer une liste de joueurs
- organiser des soirées
- créer des parties
- enregistrer chaque donne
- calculer automatiquement les scores
- conserver l'historique complet
- produire des statistiques détaillées
- permettre des évolutions futures sans remise en cause de l'architecture

---

# Philosophie

Le projet repose sur plusieurs principes.

## Simplicité

L'interface doit rester simple.

Une personne ne connaissant pas l'application doit pouvoir commencer une soirée en quelques minutes.

---

## Fiabilité

Aucun calcul ne doit être approximatif.

Toutes les règles du Tarot devront être respectées.

Les données ne doivent jamais être perdues.

---

## Évolutivité

L'application est conçue pour évoluer.

L'architecture doit permettre d'ajouter facilement de nouvelles fonctionnalités sans devoir réécrire les modules existants.

---

## Maintenabilité

Le code doit rester :

- clair
- documenté
- organisé
- facilement testable

Chaque classe possède une seule responsabilité.

---

# Public concerné

L'application est destinée :

- aux joueurs occasionnels
- aux clubs de Tarot
- aux associations
- aux groupes d'amis
- aux organisateurs de tournois privés

---

# Plateformes

La version 2 est développée avec Flutter.

Les plateformes visées sont :

- Windows
- Android

Le support de Linux, macOS et éventuellement du Web pourra être ajouté ultérieurement.

---

# Fonctionnalités principales

## Gestion des joueurs

- création
- modification
- désactivation
- recherche

---

## Gestion des soirées

- création d'une soirée
- sélection des joueurs
- historique des soirées

---

## Gestion des parties

- création automatique des donnes
- suivi du donneur
- saisie des contrats
- calcul automatique

---

## Statistiques

- score total
- nombre de parties
- victoires
- moyenne
- évolution dans le temps

---

## Historique

Toutes les soirées seront conservées.

Aucune donnée ne sera perdue.

---

# Principes techniques

Le projet suit une architecture "Feature First".

Chaque fonctionnalité possède son propre module.

La logique métier est totalement séparée de l'interface utilisateur.

L'accès aux données passe exclusivement par les repositories.

---

# Qualité

Chaque évolution suit le processus suivant :

1. conception
2. documentation
3. développement
4. analyse Flutter
5. tests
6. commit Git
7. mise à jour de la documentation

---

# Objectif final

Produire une application de gestion de Tarot :

- moderne
- robuste
- rapide
- agréable à utiliser
- facilement maintenable
- suffisamment documentée pour pouvoir être reprise plusieurs années plus tard.