# Base de données

Projet : TarotScore V2
Document : 02_BaseDeDonnees.md
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
2. Choix techniques
3. Schéma général
4. Table Players
5. Tables prévues
6. Règles de conception
7. Gestion des migrations

---

# 1. Objectifs

La base de données doit permettre :

- de conserver toutes les informations de manière fiable ;
- de ne jamais perdre l'historique des soirées ;
- d'assurer de bonnes performances ;
- de permettre les évolutions futures sans restructuration majeure.

La base est entièrement locale et embarquée dans l'application.

---

# 2. Choix techniques

## Moteur

SQLite

## Accès

sqflite

sqflite_common_ffi (Windows)

## Version actuelle

Version 1

---

# 3. Schéma général

À terme, la base comportera les tables suivantes :

```
players
    │
    ├──────────────┐
    │              │
sessions       session_players
    │              │
    └──────┬───────┘
           │
         games
           │
        contracts
```

Cette structure pourra évoluer en fonction des besoins.

---

# 4. Table : players

## Description

Contient la liste de tous les joueurs connus de l'application.

Les joueurs ne sont jamais supprimés automatiquement.

Un joueur peut être désactivé.

---

### Colonnes

| Colonne | Type | Null | Description |
|----------|------|------|-------------|
| id | INTEGER | Non | Clé primaire auto-incrémentée |
| uuid | TEXT | Non | Identifiant unique permanent |
| first_name | TEXT | Non | Prénom |
| last_name | TEXT | Non | Nom |
| nickname | TEXT | Oui | Surnom |
| email | TEXT | Oui | Adresse mail |
| phone | TEXT | Oui | Téléphone |
| avatar | TEXT | Oui | Photo ou chemin vers l'image |
| active | INTEGER | Non | 1 = actif / 0 = désactivé |
| created_at | TEXT | Non | Date de création |
| updated_at | TEXT | Non | Dernière modification |

---

### Index

À créer ultérieurement :

- uuid
- last_name
- active

---

### Contraintes

- uuid unique
- prénom obligatoire
- nom obligatoire

---

# 5. Tables prévues

## sessions

Une soirée de Tarot.

---

## session_players

Association entre une soirée et ses joueurs.

---

## games

Une donne.

---

## contracts

Résultat d'une donne.

---

## statistics

Vue calculée (pas forcément une table physique).

---

# 6. Règles de conception

Toutes les tables possèdent :

- une clé primaire INTEGER
- un uuid permanent
- une date de création
- une date de modification

Les suppressions physiques sont évitées autant que possible.

On privilégie la désactivation logique.

Les relations utilisent des clés étrangères.

---

# 7. Migrations

## Version 1

Création de la table :

- players

---

# Évolutions prévues

Version 2

- sessions
- session_players

Version 3

- games

Version 4

- moteur de statistiques

Version 5

- optimisation des index