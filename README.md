# Réparbre

**Un réseau social pour réparer les humains en faisant des calins aux arbres.**

## Description
Réparbre est une plateforme qui encourage les utilisateurs à passer du temps dans la nature en faisant des "calins" aux arbres. Chaque semaine, un arbre est choisi, et les utilisateurs gagnent des "réserves de bonheur" en y passant du temps. Ces réserves peuvent ensuite être dépensées pour des intentions positives.

## Fonctionnalités (MVP)
- Authentification via Google OAuth.
- Arbre de la semaine : Un arbre aléatoire avec sa position GPS.
- Enregistrement d’un calin : Bouton pour valider un calin (minimum 5 minutes).
- Réserves de bonheur : Calcul automatique des points (1 point par 5 minutes + bonus pour les autres utilisateurs présents).
- Dépense des réserves : Système d’intentions (ex: "Je vais appeler ma mère").
- Profil utilisateur : Historique des calins et des intentions.
- Groupes locaux : Liste des utilisateurs ayant fait un calin à l’arbre de la semaine.

## Stack Technique
- **Backend** : Node.js (Express) + SQLite.
- **Frontend** : Svelte + Tailwind CSS.
- **Hébergement** : Docker + Caddy (reverse proxy).
- **Géolocalisation** : API Geolocation du navigateur.
- **Authentification** : Google OAuth.

## Structure du Projet
```
reparbre/
├── backend/               # Backend (Node.js)
├── frontend/              # Frontend (Svelte)
├── data/                  # Stockage local (SQLite, logs)
├── docker-compose.yml     # Orchestration Docker
├── deploy.sh              # Script de déploiement
└── README.md              # Documentation
```

## Licence
Ce projet est sous licence **MIT**.