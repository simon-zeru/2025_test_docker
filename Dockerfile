# Utilisation d'une image de base générique et lourde
# FROM ubuntu:latest ❌ -> Beaucoup trop lourd pour un programme simple

# Première étape : compilation du programme
# Utilisation d'une image de base légère
FROM gcc:latest as builder

# Répertoire de travail dans l'image
WORKDIR /app

# Copie du Makefile et des sources C
COPY Makefile .
COPY src/ src/

# Mise à jour des paquets et installation de dépendances
RUN apt-get update && \
    apt-get install -y make && \
    make && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# Utilisation d'une image de base légère
FROM alpine:latest

# Installer uniquement les dépendances nécessaires
RUN apk --no-cache add libc6-compat

# Répertoire de travail dans l'image
WORKDIR /app

# Copier l'exécutable depuis l'étape précédente pour réduire la taille de l'image
COPY --from=builder /app/calculator .

EXPOSE 8080

# Commande pour exécuter le programme
CMD ["./calculator"]

# Résultat de l'optimisation : 
# PS C:\Simon\Info\c\2025_test_docker> docker images                   
# REPOSITORY                              TAG                IMAGE ID       CREATED          SIZE
# calculator-app                          latest             97215f9f3f2c   38 seconds ago   8.01MB
# <none>                                  <none>             cf21eb3bc2a5   19 minutes ago   347MB

# L'image finale est 43 fois plus petite que l'image de base
