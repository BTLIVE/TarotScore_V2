# Règles Métier

Projet : TarotScore V2
Document : 03_ReglesMetier.md
Version : 1.0
Date de création : 05/07/2026
Dernière mise à jour : 05/07/2026
Statut : En évolution
Auteur : David & ChatGPT

---

# Historique

| Version | Date | Auteur | Description |
|----------|------|---------|-------------|
| 1.0 | 05/07/2026 | David & ChatGPT | Création du document |

---

# Objectif

Ce document décrit les règles métier utilisées par TarotScore V2.

Il constitue la référence fonctionnelle du moteur de calcul.

Le moteur ne doit jamais implémenter une règle qui ne soit pas documentée ici.

Les règles officielles FFT constituent le profil de référence.

Les variantes locales sont gérées par les profils de règles.

---

# Sommaire

1. Principes généraux
2. Les joueurs
3. La soirée
4. Une donne
5. Les contrats
6. Le chien
7. Le partenaire
8. Les annonces
9. Le résultat
10. Le calcul des scores
11. Les variantes
12. Les profils de règles
13. Cas particuliers
14. Historique des évolutions

---

# 1. Principes généraux

Les règles de référence sont celles de la Fédération Française de Tarot (FFT).

Toute règle locale est considérée comme une variante configurable.

Aucune règle locale ne modifie le moteur.

Elle modifie uniquement le profil utilisé.

---

# 2. Les joueurs

Décrit :

- les parties à 3 joueurs
- les parties à 4 joueurs
- les parties à 5 joueurs
- les rôles des joueurs

À compléter.

---

# 3. La soirée

Décrit :

- création
- sélection des joueurs
- profil de règles
- succession des donnes
- clôture

À compléter.

---

# 4. Une donne

Décrit le cycle complet :

Distribution

↓

Enchères

↓

Contrat

↓

Chien

↓

Jeu

↓

Résultat

↓

Calcul

À compléter.

---

# 5. Les contrats

Décrira :

- Petite
- Garde
- Garde Sans
- Garde Contre

Pour chacun :

- définition
- règles FFT
- variantes possibles
- paramètres configurables

---

# 6. Le chien

Décrira :

- composition
- utilisation
- exceptions
- variantes

---

# 7. Le partenaire

Décrira :

- fonctionnement à cinq joueurs
- choix
- rôles
- variantes

---

# 8. Les annonces

Chaque annonce fera l'objet d'une section.

## Petit au bout

Description

Règle FFT

Paramètres

Variantes

Impact moteur

---

## Poignée

Même structure.

---

## Chelem

Même structure.

---

## Misères

Même structure.

---

# 9. Le résultat

Décrira :

- calcul des points
- seuils
- réussite
- échec

---

# 10. Calcul des scores

Ce chapitre décrira :

- formule générale
- multiplicateurs
- bonus
- malus
- répartition

Aucun détail ne sera codé avant d'être documenté ici.

---

# 11. Variantes

Toutes les variantes seront décrites.

Exemple :

Club XXX

Famille Martin

Tournoi YYY

Pour chacune :

- objectif
- différence avec FFT
- paramètres

---

# 12. Profils de règles

Explique comment les variantes sont regroupées dans un profil.

Décrit le lien avec le Rule Engine.

---

# 13. Cas particuliers

Toutes les situations exceptionnelles.

Exemples :

- erreur de saisie
- abandon
- donne annulée
- reprise d'une soirée

---

# 14. Historique

Toutes les évolutions importantes des règles métier seront consignées ici.
