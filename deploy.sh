#!/bin/bash

# Builder les conteneurs Docker
docker-compose build

# Lancer les conteneurs
docker-compose up -d

# Vérifier que tout fonctionne
docker-compose ps