# Rule Engine

Projet : TarotScore V2
Document : 09_RuleEngine.md
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

1. Objectif
2. Philosophie
3. Architecture générale
4. Les composants
5. Cycle de calcul
6. Catégories de règles
7. Profils de règles
8. Évolutions futures

---

# 1. Objectif

Le Rule Engine est le cœur fonctionnel de TarotScore V2.

Il permet de calculer les scores en fonction d'un ensemble de règles configurables.

Le moteur ne connaît aucune règle spécifique au Tarot.

Toutes les règles proviennent d'un profil.

---

# 2. Philosophie

Le moteur est totalement indépendant :

- de la FFT
- des clubs
- des variantes
- des habitudes locales

Il applique uniquement les paramètres qui lui sont fournis.

Ainsi, une même partie pourra être calculée avec plusieurs profils différents.

---

# 3. Architecture générale

Le moteur suit l'architecture suivante :

```
                Rule Definitions
                       │
                       ▼
                Rule Profile
                       │
                       ▼
                 Rule Engine
                       │
                       ▼
              Score Calculator
                       │
                       ▼
                 Game Result
```

Chaque composant possède une responsabilité unique.

---

# 4. Les composants

## RuleDefinition

Décrit une règle disponible dans l'application.

Exemple :

- identifiant
- nom
- type
- catégorie
- valeur par défaut
- description

Une définition ne contient jamais une valeur propre à un club.

---

## RuleProfile

Un profil contient les valeurs effectivement utilisées.

Exemples :

FFT

Club de Dijon

Maison

Tournoi annuel

Chaque soirée référence un profil.

---

## RuleEngine

Le RuleEngine fournit une interface unique permettant d'accéder aux règles.

Exemple :

```
rules.getBool(...)
rules.getInt(...)
rules.getDouble(...)
rules.getString(...)
```

Le moteur masque complètement l'origine des données.

---

## ScoreCalculator

Le calculateur applique les règles.

Il ne contient aucune constante métier.

Il ne connaît que le RuleEngine.

---

# 5. Cycle de calcul

Pour chaque donne :

```
Game

↓

Profile

↓

Rule Engine

↓

Score Calculator

↓

Résultat
```

Le calculateur ne consulte jamais directement la base de données.

---

# 6. Catégories de règles

Les règles sont classées en trois familles.

## Paramètres

Valeurs numériques.

Exemples :

- bonus poignée
- bonus Petit
- bonus Chelem

---

## Options

Activation d'un comportement.

Type :

bool

Exemples :

- Petit au bout
- Misère
- Chelem annoncé

---

## Mécaniques

Modifient le fonctionnement du moteur.

Exemples :

- calcul spécifique
- redistribution
- variantes particulières

Ces règles pourront nécessiter des stratégies dédiées.

---

# 7. Profils

Chaque profil possède :

- un nom
- une description
- une date
- un auteur
- une version

Un profil peut être :

- créé
- modifié
- dupliqué
- exporté
- importé

Les profils FFT seront fournis par défaut.

---

# 8. Évolutions futures

Le moteur devra permettre :

- plusieurs profils installés
- import/export JSON
- partage entre joueurs
- profils officiels
- profils personnels
- profils de club

Aucune évolution ne devra remettre en cause l'architecture du moteur.