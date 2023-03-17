# Description du micro-service

Le UserService possède une architecture Domain Driven Design (DDD)

## Arborescence :
```
UserService/
├── app.rb
├── config.ru
├── Gemfile
├── Rakefile
├── config/
│   ├── database.yml
│   └── environments.rb
├── domain/
│   ├── entities/
│   │   └── user.rb
│   ├── repositories/
│   │   └── user_repository.rb
│   └── value_objects/
│       ├── email.rb
│       └── role.rb
├── application/
│   ├── commands/
│   │   ├── create_user_command.rb
│   │   ├── delete_user_command.rb
│   │   ├── update_user_command.rb
│   │   └── change_role_command.rb
│   └── services/
│       ├── user_service.rb
│       └── authentication_service.rb
├── infrastructure/
│   ├── orm_adapters/
│   │   └── active_record_adapter.rb
│   └── migrations/
│       ├── 01_create_users.rb
│       └── 02_add_role_to_users.rb
└── interfaces/
    ├── api/
    │   ├── v1/
    │   │   ├── users_controller.rb
    │   │   └── api_helpers.rb
    │   └── config.ru
    └── swagger/
        ├── api_docs.yml
        └── config.ru
```
## Description de l'arborescence

### Racine 

- app.rb : C'est le fichier principal de l'application qui configure et lance le serveur Sinatra. Il charge les différents fichiers de configuration, initialise les services et les contrôleurs, et configure les routes pour l'API.

- config.ru : C'est le fichier de configuration Rack, un serveur d'applications web Ruby. Il charge l'application Sinatra et définit les middlewares nécessaires pour l'exécution de l'application.

- Gemfile : C'est le fichier qui liste toutes les dépendances (gems) nécessaires pour l'application. Il inclut les gems pour Sinatra, ActiveRecord, la base de données, et d'autres outils utiles.

- Rakefile : C'est le fichier qui définit les tâches Rake pour l'application. Les tâches Rake sont des scripts en Ruby qui automatisent certaines opérations, comme la création de migrations de base de données, l'exécution de tests, etc.

### Config

- config/ : Ce dossier contient les fichiers de configuration pour différents aspects de l'application.

  - ``database.yml`` : Ce fichier contient la configuration de la connexion à la base de données pour les différents environnements de l'application (développement, test, production).

  - ``environments.rb`` : Ce fichier configure les différents environnements de l'application, comme le chargement des gems spécifiques à chaque environnement, les paramètres de connexion à la base de données, et les autres paramètres spécifiques à chaque environnement.

### Domain

Le dossier ``domain`` contient les éléments liés au modèle de domaine de l'application. Ces éléments représentent les concepts métier et les règles métier de l'application.

- ``entities/`` : Ce dossier contient les classes d'entités, qui représentent les objets métier de l'application. Dans notre cas, il y a un seul fichier :

    - ``user.rb`` : Ce fichier définit la classe User, qui représente un utilisateur de l'application. Cette classe contient les attributs de l'utilisateur (nom, prénom, adresse e-mail, mot de passe et rôle) et les méthodes pour manipuler ces attributs, comme la validation des données et la gestion du mot de passe.

- ``repositories/`` : Ce dossier contient les classes de repositories, qui sont responsables de la persistance et de la récupération des entités. Les repositories interagissent avec la couche d'infrastructure pour effectuer des opérations sur la base de données. Voici le fichier de ce dossier :

    - ``user_repository.rb`` : Ce fichier définit la classe UserRepository, qui gère la persistance des objets User. Cette classe interagit avec la base de données pour créer, lire, mettre à jour et supprimer des objets User. UserRepository implémente les méthodes du pattern Repository pour encapsuler la logique d'accès aux données.

- ``value_objects/`` : Ce dossier contient les classes de value objects, qui représentent des objets immuables ayant une identité basée sur leur valeur. Les value objects sont utilisés pour encapsuler des attributs ou des comportements spécifiques au domaine. Voici les fichiers de ce dossier :

    - ``email.rb`` : Ce fichier définit la classe Email, qui est un value object représentant une adresse e-mail. Cette classe contient des méthodes pour valider la structure d'une adresse e-mail et pour s'assurer qu'elle est unique parmi les utilisateurs de l'application.

    - ``role.rb`` : Ce fichier définit la classe Role, qui est un value object représentant le rôle d'un utilisateur (par exemple, administrateur, utilisateur normal, etc.). Cette classe peut contenir des méthodes pour déterminer les permissions associées à chaque rôle ou pour valider les rôles autorisés dans l'application.

### Application

Le dossier ``application`` contient les commandes et les services liés à l'application. Ces éléments mettent en œuvre la logique métier et interagissent avec la couche de domaine.

- ``commands/`` : Ce dossier contient les classes de commandes qui représentent les actions de l'application. Chaque classe de commande encapsule une opération spécifique et ses paramètres. Voici les fichiers de ce dossier :

    - ``create_user_command.rb`` : Ce fichier définit la commande pour créer un nouvel utilisateur. Il contient la logique pour valider les paramètres requis (nom, prénom, adresse e-mail et mot de passe) et créer un nouvel objet utilisateur.

    - ``delete_user_command.rb`` : Ce fichier définit la commande pour supprimer un utilisateur existant. Il contient la logique pour valider l'ID de l'utilisateur à supprimer et appeler le bon service pour effectuer la suppression.

    - ``update_user_command.rb`` : Ce fichier définit la commande pour mettre à jour les informations d'un utilisateur existant. Il contient la logique pour valider les paramètres de mise à jour (nom, prénom, adresse e-mail et/ou mot de passe) et appeler le bon service pour effectuer la mise à jour.

    - ``change_role_command.rb`` : Ce fichier définit la commande pour changer le rôle d'un utilisateur. Il contient la logique pour valider le nouveau rôle et appeler le bon service pour effectuer le changement de rôle.

- ``services/`` : Ce dossier contient les classes de services d'application qui implémentent la logique métier en interagissant avec les entités du domaine et les repositories. Voici les fichiers de ce dossier :

     - ``user_service.rb`` : Ce fichier définit le service UserService, qui contient la logique métier pour gérer les utilisateurs. Il utilise les commandes pour créer, mettre à jour, supprimer et changer le rôle des utilisateurs, ainsi que pour récupérer les informations des utilisateurs. UserService interagit également avec le UserRepository pour effectuer des opérations de persistance.

    - ``authentication_service.rb`` : Ce fichier définit le service AuthenticationService, qui gère l'authentification et l'autorisation des utilisateurs. Il vérifie les identifiants de l'utilisateur (adresse e-mail et mot de passe) et génère un token d'accès si l'authentification est réussie. Il vérifie également les permissions des utilisateurs en fonction de leur rôle.

### Infrastructure

Le dossier infrastructure contient les éléments liés à la mise en œuvre technique de l'application, tels que l'accès aux données, la communication avec des services externes et les détails de la base de données. Il sert de pont entre les couches de domaine et d'application et les ressources externes.

- ``orm_adapters/`` : Ce dossier contient les adaptateurs pour les mappers de l'ORM (Object-Relational Mapper) utilisé par l'application. Dans notre cas, nous utilisons ActiveRecord comme ORM. Voici le fichier de ce dossier :

    - ``active_record_adapter.rb`` : Ce fichier définit l'adaptateur pour ActiveRecord, qui est responsable de la gestion de la connexion à la base de données et de la configuration des modèles ActiveRecord. Il fournit également les méthodes pour interagir avec les repositories et pour effectuer des opérations CRUD sur les entités.

- ``migrations/`` : Ce dossier contient les fichiers de migration de la base de données, qui sont des scripts pour créer, modifier ou supprimer des tables et des colonnes dans la base de données. Les migrations permettent de gérer l'évolution du schéma de la base de données au fil du temps. Voici les fichiers de ce dossier :

    - ``01_create_users.rb`` : Ce fichier de migration crée la table users avec les colonnes correspondant aux attributs de l'entité User (nom, prénom, adresse e-mail et mot de passe).

    - ``02_add_role_to_users.rb`` : Ce fichier de migration ajoute une colonne role à la table users, qui stocke le rôle de l'utilisateur.

### Interfaces

Le dossier interfaces contient les éléments liés aux interfaces utilisateur de l'application, tels que les contrôleurs de l'API, les helpers et la documentation de l'API. Il sert de point d'entrée pour les interactions entre les utilisateurs (ou les clients) et l'application.

- ``api/`` : Ce dossier contient les fichiers relatifs à l'API REST de l'application. Il inclut les contrôleurs, les routes et les helpers pour les différentes versions de l'API. Voici les sous-dossiers et fichiers de ce dossier :

  - ``v1/`` : Ce sous-dossier contient les fichiers pour la version 1 de l'API REST.

    + ``users_controller.rb`` : Ce fichier définit le contrôleur UsersController, qui gère les requêtes HTTP concernant les utilisateurs. Il utilise le UserService pour effectuer des opérations sur les utilisateurs et renvoie des réponses JSON aux clients.

    + ``api_helpers.rb`` : Ce fichier contient des méthodes d'aide (helpers) pour les contrôleurs de l'API, telles que la gestion des erreurs, la validation des paramètres et la pagination des résultats.

  - ``config.ru`` : Ce fichier de configuration Rack charge les contrôleurs et les helpers de l'API, définit les routes pour les différentes versions de l'API et configure les middlewares nécessaires à l'exécution de l'API.

- ``swagger/`` : Ce dossier contient les fichiers relatifs à la documentation de l'API avec Swagger. Swagger est un outil qui génère une interface utilisateur pour explorer et tester l'API à partir de sa spécification.

    - ``api_docs.yml`` : Ce fichier contient la spécification de l'API au format OpenAPI, qui décrit les points de terminaison, les paramètres, les réponses et les schémas de l'API.

    - ``config.ru`` : Ce fichier de configuration Rack charge la documentation Swagger, configure les middlewares nécessaires et sert l'interface utilisateur Swagger.