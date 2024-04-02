# Script de création de base de données pour un projet

Ce script bash automatise la création d'une base de données MariaDB pour un projet donné. Il installe MariaDB si nécessaire, crée une nouvelle base de données avec le nom du projet et un nouvel utilisateur associé à cette base de données.

## Prérequis

Avant d'utiliser ce script, assurez-vous d'avoir installé les outils suivants :

- OpenSSL (pour générer des mots de passe aléatoires)

## Utilisation

Pour utiliser ce script, suivez les étapes ci-dessous :

1. Assurez-vous d'exécuter le script en tant que superutilisateur (`root`).

```bash
sudo ./create-db.sh [NomDuProjet]
```

2. Si aucun nom de projet n'est spécifié en tant qu'argument, le script demandera à l'utilisateur de le saisir.

```bash
sudo ./create-db.sh
```

## Fonctionnalités

- Installation automatique de MariaDB si nécessaire.
- Création d'une nouvelle base de données portant le nom du projet.
- Création d'un nouvel utilisateur portant également le nom du projet, avec un mot de passe aléatoire de 16 caractères.
- Attribution de tous les droits sur la nouvelle base de données à cet utilisateur.
- Affichage des informations récapitulatives, y compris le mot de passe à utiliser pour se connecter à la base avec le nouvel utilisateur.