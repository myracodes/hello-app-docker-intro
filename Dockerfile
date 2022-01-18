FROM node:lts-alpine

RUN mkdir /app 
#RUN te permet d'exécuter une commande comme tu le ferais dans ton terminal.

WORKDIR /app
# WORKDIR définit un répertoire de travail

COPY index.js index.js
# COPY copie le fichier indiqué de ta machine dans l'image.

CMD node index.js
# Sur ta machine afin de démarrer ton application tu dois taper node index.js sur ton terminal.
# C'est exactement la même commande que ton image doit exécuter grâce à l'instruction CMD.

# Les commandes RUN et CMD peuvent sembler similaires mais ne le sont pas.
# RUN est exécutée lors de la compilation de l'image.
# CMD définit la commande par défaut à lancer au démarrage du conteneur.
# On peut avoir plusieurs RUN mais un seul CMD.

# Pour construire l'image, run command in terminal: "docker build -t hello-app ."
# L'argument -t est optionnel et permet de taguer l'image afin de la retrouver plus facilement.

# Afin de vérifier que l'image a bien été compilée, lister les images disponibles : "docker image ls"

# Pour exécuter le code, il faut dire à Docker d'exécuter l'image : "docker run hello-app"
# Pour lister les conteneurs en cours d'exécution, utiliser la commande "docker ps"

# Si l'appli ne contient qu'un console.log(), par ex, elle se termine après l'exécutiion de cette commande, elle quitte, et le conteneur n'est donc pas visible dans les processus Docker
# Pour voir le processus, on peut remplacer le console.log() par un setInterval().

# ATTENTION : Quand on modifie le code de l'app, il faut qu'il soit à nouveau copié dans l'image. Donc le setInterval ne sera exécuté que si on refait la commande "docker build -t hello-app ."
# puis "docker run hello-app"
# Possible de le faire en une seule commande avec le && operator : "docker build -t hello-app . && docker run hello-app"

# Pour arrêter le processus, il faut ouvrir un autre terminal, faire 'docker ps' pour trouver tous les conteneurs, copier l'id du conteneur, puis run "docker stop <id du conteneur>"
