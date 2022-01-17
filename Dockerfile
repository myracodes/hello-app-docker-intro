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