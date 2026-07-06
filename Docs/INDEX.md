# Documentation - TarotScore V2

Projet : TarotScore V2
Document : INDEX.md
Version : 1.0
Date de création : 05/07/2026
Dernière mise à jour : 05/07/2026
Statut : Validé
Auteur : David & ChatGPT

---

# Bienvenue

Ce dossier contient toute la documentation officielle de TarotScore V2.

La documentation constitue la référence du projet.

Le code doit toujours rester conforme à cette documentation.

---

# Organisation

## Vision

| Document | Description |
|----------|-------------|
| 00_Vision.md | Vision et objectifs du projet |

---

## Architecture

| Document | Description |
|----------|-------------|
| 01_Architecture.md | Architecture générale |
| 02_BaseDeDonnees.md | Structure SQLite |
| 06_Conventions.md | Conventions de développement |
| 08_Decisions.md | Décisions d'architecture |

---

## Métier

| Document | Description |
|----------|-------------|
| 03_ReglesMetier.md | Règles du Tarot |
| 09_RuleEngine.md | Architecture du moteur |
| 10_RuleCatalog.md | Catalogue des règles |
| 11_TestCases.md | Cas de tests métier |

---

## Gestion du projet

| Document | Description |
|----------|-------------|
| 04_Todo.md | Tableau de bord |
| 05_Changelog.md | Historique des versions |
| 07_Roadmap.md | Planification du projet |

---

## Fonctionnel

| Document | Description |
|----------|-------------|
| 12_Fonctionnalites.md | Cahier des charges fonctionnel |
| 13_UI_UX.md | Principes d'ergonomie |

---

# Ordre de lecture conseillé

Pour comprendre rapidement le projet :

1. README.md
2. 00_Vision.md
3. 01_Architecture.md
4. 06_Conventions.md
5. 12_Fonctionnalites.md
6. 03_ReglesMetier.md

Les autres documents servent de référence pendant le développement.

---

# Cycle de développement

Chaque fonctionnalité suit obligatoirement les étapes suivantes :

1. Mise à jour de la documentation
2. Conception
3. Développement
4. flutter analyze
5. Tests
6. Commit Git
7. Mise à jour du Changelog
8. Mise à jour du Todo

---

# Règles importantes

Le projet suit les principes suivants :

- Une seule responsabilité par classe.
- Aucune règle métier codée en dur si elle peut être configurée.
- Le moteur de calcul est piloté par des profils de règles.
- Les règles FFT sont fournies sous forme d'un profil par défaut.
- La documentation fait foi.

---

# État actuel

Version :

v2.0.0-alpha1

Statut :

✅ Fondations terminées

Début du développement fonctionnel :

Sprint 1 – Gestion des joueurs

---

# Documents vivants

Les documents suivants sont mis à jour régulièrement :

- 02_BaseDeDonnees.md
- 03_ReglesMetier.md
- 04_Todo.md
- 05_Changelog.md
- 07_Roadmap.md
- 08_Decisions.md
- 10_RuleCatalog.md
- 11_TestCases.md
- 12_Fonctionnalites.md

---

# Documents de référence

Les documents suivants ne changent que très rarement :

- 00_Vision.md
- 01_Architecture.md
- 06_Conventions.md
- 09_RuleEngine.md
- 13_UI_UX.md

---

# Conclusion

Cette documentation a pour objectif de permettre la reprise du développement de TarotScore V2 à tout moment, sans dépendre de l'historique des conversations.

Toute évolution importante du projet doit être documentée avant son implémentation.

Mise à jour : v2.0.0-alpha2 - Domain Baseline.
