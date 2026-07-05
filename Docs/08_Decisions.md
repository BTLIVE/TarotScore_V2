# Décisions d'architecture

Projet : TarotScore V2
Document : 08_Decisions.md
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

1. Principe
2. Décisions validées
3. Règles de mise à jour

---

# 1. Principe

Ce document conserve les décisions importantes prises pendant le développement de TarotScore V2.

Une décision validée ne doit être remise en cause que si une meilleure solution est identifiée et documentée.

Chaque décision reçoit un identifiant unique.

Format :

D-001

D-002

D-003

...

---

# 2. Décisions

---

## D-001 — Moteur piloté par les données

Statut : Validée

### Décision

Le moteur de calcul ne contient aucune règle de Tarot codée en dur.

Toutes les règles sont fournies par un profil de règles.

### Motivation

Permettre la prise en charge des règles locales sans modifier le moteur de calcul.

### Conséquences

- moteur générique
- profils configurables
- évolutivité maximale

---

## D-002 — Architecture Feature First

Statut : Validée

### Décision

Chaque fonctionnalité possède son propre module.

### Motivation

Limiter les dépendances.

Faciliter la maintenance.

### Conséquences

Chaque module contient :

- models
- repositories
- services
- screens
- widgets

---

## D-003 — Documentation avant développement

Statut : Validée

### Décision

Toute fonctionnalité importante est documentée avant d'être développée.

### Motivation

Éviter les changements d'architecture en cours de développement.

### Conséquences

Le développement suit toujours :

Documentation

↓

Architecture

↓

Développement

↓

Tests

↓

Commit Git

---

## D-004 — flutter analyze doit toujours être vert

Statut : Validée

### Décision

Aucun développement ne continue tant que flutter analyze retourne une erreur.

### Motivation

Maintenir un projet toujours compilable.

---

## D-005 — Une responsabilité par classe

Statut : Validée

### Décision

Chaque classe possède une seule responsabilité.

### Motivation

Faciliter les tests.

Limiter les effets de bord.

---

## D-006 — Les règles FFT sont le profil par défaut

Statut : Validée

### Décision

Les règles officielles FFT sont fournies sous forme d'un profil de règles.

Elles ne sont pas codées dans le moteur.

### Motivation

Les règles FFT deviennent un profil parmi d'autres.

Les clubs peuvent créer leurs propres profils.

---

## D-007 — Les règles locales sont une fonctionnalité majeure

Statut : Validée

### Décision

La gestion des profils de règles est une fonctionnalité centrale de TarotScore V2.

Elle est développée comme un module indépendant.

### Motivation

C'est le principal facteur différenciant du projet.

---

## D-008 — Le code implémente la documentation

Statut : Validée

### Décision

La documentation constitue la référence officielle.

Le code doit toujours rester conforme à la documentation.

### Motivation

Permettre la reprise du projet sans dépendre de l'historique des conversations.

---

# 3. Règles

Une décision ne doit jamais être supprimée.

Si elle évolue :

- elle est marquée "Obsolète"

ou

- une nouvelle décision est créée.

L'historique des décisions est conservé pendant toute la durée de vie du projet.