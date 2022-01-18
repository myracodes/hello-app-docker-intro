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

# Si l'appli ne contient qu'un console.log(), par ex, elle se termine après l'exécution de cette commande, elle quitte, et le conteneur n'est donc pas visible dans les processus Docker
# Pour voir le processus, on peut remplacer le console.log() par un setInterval().

# ATTENTION : Quand on modifie le code de l'app, il faut qu'il soit à nouveau copié dans l'image. Donc le setInterval ne sera exécuté que si on refait la commande "docker build -t hello-app ."
# puis "docker run hello-app"
# Possible de le faire en une seule commande avec le && operator : "docker build -t hello-app . && docker run hello-app"

# Pour arrêter le processus, il faut ouvrir un autre terminal, faire 'docker ps' pour trouver tous les conteneurs, copier l'id du conteneur, puis run "docker stop <id du conteneur>"

# Pour afficher les logs : "docker logs -f containerId"
# L'option -f permet d'afficher les logs en continu.
# On peut récupérer la main en faisant Ctrl+C.
# Cela n'interrompt pas l'exécution du conteneur.

# PARTAGER L'APP SUR DOCKERHUB

# Un des intérêts de Docker est de pouvoir partager une application avec n'importe qui disposant de Docker, sans que la personne n'ait besoin de faire la moindre installation.
# Elle aura juste à récupérer l'image avec la commande "docker pull" puis la démarrer avec "docker run".

# Utiliser "docker login" pour se connecter à son compte Docker

# Puis taguer l'image avec son DockerID:
# Afin de pouvoir pousser l'image sur DockerHub il faut d'abord la compiler :"docker build -t <username>/hello-app ."
# Puis la pousser : "docker push <username>/hello-app"

#  vérifier sur DockerHub que l'image a bien été poussée : https://hub.docker.com/repository/docker/<username>/hello-app.

# RECUPERER L'IMAGE SUR UNE AUTRE MACHINE
# "docker pull <username>/hello-app"

# Attention : le poids d'une image n'est pas anodin !
# Chaque image embarque le poids de ses applicatifs (ici alpine et NodeJs soit environ 100 Mo)
# Après cette quête pense à effacer les images qui ne te seront plus utiles avec la commande docker image rm
