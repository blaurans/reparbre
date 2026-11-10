# Réparbre - Handoff

Ce document résume les décisions techniques et fonctionnelles prises pour le projet **Réparbre**, ainsi que les étapes pour reprendre le développement.

---

## Décisions Techniques

### Stack Technique
- **Backend** : Node.js (Express) + SQLite.
  - Raison : Simplicité et légèreté pour le MVP.
- **Frontend** : Svelte + Tailwind CSS.
  - Raison : Léger, moderne et facile à prendre en main.
- **Authentification** : Google OAuth.
  - Raison : Simplifie la gestion des utilisateurs.
- **Géolocalisation** : API Geolocation du navigateur.
  - Raison : Pas besoin de service externe pour le MVP.
- **Hébergement** : Docker + Caddy.
  - Raison : Déploiement simple et sécurisé (HTTPS via Caddy).
- **Base de données** : SQLite.
  - Raison : Léger, pas besoin de serveur dédié pour le MVP.

---

## Configuration Requise

### Prérequis
- Node.js (v20+) et npm.
- Docker et Docker Compose.
- Google OAuth Credentials (à configurer dans `.env`).
- Caddy (déjà configuré sur `ociuc`).

### Variables d’Environnement
Créez un fichier `.env` dans le dossier `backend/` avec les variables suivantes :

```
PORT=3000
NODE_ENV=development

# Google OAuth
GOOGLE_CLIENT_ID=votre_client_id
GOOGLE_CLIENT_SECRET=votre_client_secret
GOOGLE_CALLBACK_URL=https://reparbre.laurans.org/auth/google/callback

# Base de données
DB_PATH=./data/db/reparbre.sqlite

# Sécurité
SESSION_SECRET=votre_secret_de_session
RATE_LIMIT_WINDOW_MS=60000  # 1 minute
RATE_LIMIT_MAX=100          # 100 requêtes par fenêtre
```

---

## Déploiement

### Étapes pour Déployer
1. Cloner le dépôt :
   ```bash
   git clone https://github.com/blaurans/reparbre.git
   cd reparbre
   ```

2. Configurer les variables d’environnement :
   - Créez un fichier `.env` dans `backend/` (voir ci-dessus).

3. Builder et lancer les conteneurs :
   ```bash
   chmod +x deploy.sh
   ./deploy.sh
   ```

4. Vérifier le déploiement :
   - Accédez à `https://reparbre.laurans.org`.

### Script `deploy.sh`
```bash
#!/bin/bash

# Builder les conteneurs Docker
docker-compose build

# Lancer les conteneurs
docker-compose up -d

# Vérifier que tout fonctionne
docker-compose ps
```

---

## Structure du Projet

```
reparbre/
├── backend/
│   ├── src/
│   │   ├── routes/          # Routes de l’API
│   │   ├── models/          # Modèles de données
│   │   ├── middleware/      # Middleware (auth, rate-limiting)
│   │   ├── utils/           # Utilitaires (géolocalisation, calcul des points)
│   │   └── app.js           # Point d’entrée de l’application
│   ├── data/
│   │   └── db/             # Base de données SQLite
│   ├── .env                # Variables d’environnement
│   ├── package.json
│   └── Dockerfile
│
├── frontend/
│   ├── src/
│   │   ├── routes/          # Pages de l’application
│   │   ├── components/      # Composants réutilisables
│   │   ├── assets/          # Images, polices, etc.
│   │   └── app.css          # Styles globaux
│   ├── public/
│   ├── package.json
│   └── Dockerfile
│
├── data/
│   ├── logs/               # Logs du backend
│   └── db/                 # Base de données SQLite
│
├── docker-compose.yml
├── deploy.sh
├── README.md
└── handoff.md
```

---

## Identitié Visuelle

### Palette de Couleurs
- Vert Clair : `#A8E6CF` (Arrière-plan, boutons secondaires).
- Vert Foncé : `#2E8B57` (Texte, boutons principaux).
- Bleu Clair : `#87CEEB` (Accents, liens).
- Blanc : `#FFFFFF` (Arrière-plan des cartes).
- Gris : `#F5F5F5` (Arrière-plan des pages).

### Typographie
- Police principale : [Inter](https://rsms.me/inter/) (moderne et lisible).
- Police des titres : [Poppins](https://fonts.google.com/specimen/Poppins) (pour les titres et boutons).

### Logo
- Concept : Un arbre stylisé avec des bras humains qui l’enlacent.
- Couleurs : Vert foncé (`#2E8B57`) et bleu clair (`#87CEEB`).

---

## Fonctionnalités Implémentées (MVP)

| Fonctionnalité               | Statut       | Détails                                                                                     |
|------------------------------|--------------|---------------------------------------------------------------------------------------------|
| Authentification Google      | À implémenter | Utilisation de `passport-google-oauth20`.                                                  |
| Arbre de la semaine          | À implémenter | Choix aléatoire + affichage de la position GPS.                                             |
| Enregistrement d’un calin    | À implémenter | Bouton pour valider un calin (minimum 5 minutes).                                           |
| Calcul des points            | À implémenter | 1 point par 5 minutes + bonus pour les autres utilisateurs présents.                        |
| Dépense des réserves         | À implémenter | Système d’intentions (sans validation).                                                     |
| Profil utilisateur           | À implémenter | Historique des calins et des intentions.                                                    |
| Groupes locaux               | À implémenter | Liste des utilisateurs ayant fait un calin à l’arbre de la semaine.                         |

---

## Futures Améliorations

### Phase 2
- Événements collectifs : Formulaire pour organiser des calins collectifs.
- Design amélioré : Animations et illustrations.
- Optimisation : Cache et compression des assets.

### Phase 3
- Application mobile : PWA ou native (React Native).
- Système de parrainage : Offrir des points à un ami.
- Partenariats : Collaboration avec des associations environnementales.

---

## Contact
Pour toute question ou problème, contactez :
- **Blaurans** (développeur principal) : [GitHub](https://github.com/blaurans).

*Document généré automatiquement pour faciliter la reprise du projet.*