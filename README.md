# API Sinatra en Ruby

Ce projet est un micro service simple basé sur Sinatra pour gérer les utilisateurs.

## Structure du projet

```txt
.
├── App.rb
├── README.md
├── application
├── Gemfile
├── RakeFile
├──spec
│ ├── spec_helper.rb
│ ├── user_entrypoint_spec.rb
│ ├── entry_point
│ │ └── user_entrypoint.rb
│ └── service
│ └── users_service.rb
└── domain
├── entity
│ └── user.rb
└── repository
└── users_repository.rb
```

## Fichiers

- `App.rb` : Le point d'entrée principal de l'application Sinatra.
- `Gemfile` : Contient la liste des dépendances nécessaire au fonctionnement de l'application
- `Rakefile` : est utilisé pour définir des tâches Rake pour le projet. Rake est un outil de construction en Ruby qui permet d'automatiser certaines tâches, comme l'exécution des tests.
- `spec_helper.rb` : Est utilisé pour configurer et initialiser l'environnement de test pour le projet.
- `user_entrypoint_spec.rb` : Contient les tests pour les points d'entrée du micro-service utilisateur.
- `application/entry_point/user_entrypoint.rb` : Les points d'accès de l'API pour les utilisateurs.
- `application/service/users_service.rb` : Les services pour gérer les utilisateurs.
- `domain/entity/user.rb` : L'entité User.
- `domain/repository/users_repository.rb` : Le repository pour la gestion des utilisateurs et des interactions avec la base de données.

## Utilisation

1. Cloner ce dépôt
2. Installer les dépendances : `bundle install`
3. Lancer l'application : `ruby App.rb`

## Routes API

- `GET /users` : Récupérer tous les utilisateurs
- `GET /users/:id` : Récupérer un utilisateur par ID
- `POST /users` : Ajouter un nouvel utilisateur
- `PUT /users/:id` : Mettre à jour un utilisateur existant par ID
- `DELETE /users/:id` : Supprimer un utilisateur par ID

## Tests avec Rake

Les tests des entrypoints sont situés dans le fichier `user_entrypoint_spec.rb`, on peut les exécuter avec rake à l'aide de la commande `bundle exec rake spec`