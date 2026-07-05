# Catalogue des règles

Projet : TarotScore V2
Document : 10_RuleCatalog.md
Version : 1.0
Date de création : 05/07/2026
Dernière mise à jour : 05/07/2026
Statut : En rédaction
Auteur : David & ChatGPT

---

# Historique

| Version | Date | Auteur | Description |
|----------|------|---------|-------------|
| 1.0 | 05/07/2026 | David & ChatGPT | Création du document |

---

# Objectif

Ce document référence toutes les règles configurables de TarotScore V2.

Chaque règle possède :

- une clé unique
- un type
- une catégorie
- une valeur par défaut
- une description

Toute nouvelle règle devra être ajoutée à ce document avant son implémentation.

---

# Types

Les règles appartiennent à l'un des types suivants :

## Option

Activation ou désactivation d'une fonctionnalité.

Type technique :

bool

---

## Paramètre

Valeur numérique ou textuelle.

Types possibles :

- int
- double
- string

---

## Mécanique

Décrit un comportement particulier du moteur.

Une mécanique peut nécessiter du code spécifique.

---

# Catalogue

## Petit au bout

| Clé | Type | Valeur FFT | Description |
|------|------|------------|-------------|
| petit.enabled | Option | true | Active le Petit au bout |
| petit.value | Paramètre | 10 | Valeur du bonus |

---

## Poignée

| Clé | Type | Valeur FFT | Description |
|------|------|------------|-------------|
| poignee.enabled | Option | true | Active les poignées |
| poignee.simple | Paramètre | 20 | Valeur de la poignée simple |
| poignee.double | Paramètre | 30 | Valeur de la poignée double |
| poignee.triple | Paramètre | 40 | Valeur de la poignée triple |

---

## Chelem

| Clé | Type | Valeur FFT | Description |
|------|------|------------|-------------|
| chelem.enabled | Option | true | Active le Chelem |
| chelem.annonce | Option | true | Autorise le Chelem annoncé |
| chelem.reussi | Paramètre | 400 | Bonus d'un Chelem réussi |
| chelem.echec | Paramètre | -200 | Malus d'un Chelem annoncé et perdu |

---

## Misère

| Clé | Type | Valeur FFT | Description |
|------|------|------------|-------------|
| misere.enabled | Option | false | Active les misères |

---

## Excuse

| Clé | Type | Valeur FFT | Description |
|------|------|------------|-------------|
| excuse.enabled | Option | true | Gestion de l'Excuse |

---

# Règles locales

Les règles propres à un club ou à un groupe de joueurs utilisent les mêmes mécanismes.

Aucune distinction n'est faite entre une règle FFT et une règle locale.

La seule différence est le profil de règles utilisé.

---

# Cycle de vie

Une nouvelle règle suit toujours les étapes suivantes :

1. Ajout dans ce document.
2. Ajout dans les RuleDefinitions.
3. Ajout dans le profil FFT.
4. Développement du moteur.
5. Ajout des cas de test.
6. Validation.