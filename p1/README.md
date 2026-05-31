#K3s and Vagrant

Le premier exercice demande d'utiliser Vagrant.  
C'est un outils d'orchestration de machine virtuelles.  
Il s'exécute sur l'hôte et va:  
* télécharger une box
* lancer une VM via un provider
* configurer la VM automatiquement

Le *Vagrantfile* est à la base du fonctionnement de vagrant. Il est écrit en *ruby* et il définit ce que vagrant a besoin pour créer et gérer l'environnement.

* __box__: generic/debian12
* __provider__: virtualbox
* __provisions__: un script shell pour le master et un autre pour le worker
