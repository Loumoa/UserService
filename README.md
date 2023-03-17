```
Loumoa_sinatra/
  |-- app/
      |-- domain/
          |-- entities/
              |-- user.rb
          |-- value_objects/
              |-- email.rb
              |-- password.rb
              |-- role.rb
          |-- repositories/
              |-- user_repository.rb
          |-- services/
              |-- user_service.rb
      |-- application/
          |-- services/
              |-- user_application_service.rb
      |-- infrastructure/
          |-- persistence/
              |-- repositories/
                  |-- active_record_user_repository.rb
          |-- web/
              |-- controllers/
                  |-- users_controller.rb
              |-- views/
                  |-- users/
              |-- helpers/
                  |-- users_helper.rb
  |-- config/
      |-- database.yml
  |-- db/
      |-- migrate/
  |-- public/
  |-- spec/
      |-- domain/
      |-- application/
      |-- infrastructure/
  |-- Gemfile
  |-- Gemfile.lock
  |-- app.rb
```

Voici les fonctions des éléments de l'arborescence :

1. `app/domain/entities/user.rb` : Classe de l'entité `User` décrivant les propriétés et comportements liés à un utilisateur.
2. `app/domain/value_objects/` : Ce dossier contient les objets de valeur pour les propriétés spécifiques des utilisateurs, telles que l'email, le mot de passe et le rôle.
3. `app/domain/repositories/user_repository.rb` : Interface pour le référentiel utilisateur définissant les méthodes de communication avec la base de données.
4. `app/domain/services/user_service.rb` : Classe de service contenant la logique métier liée à la gestion des utilisateurs.
5. `app/application/services/user_application_service.rb` : Classe de service d'application responsable de la coordination entre les différentes couches du service utilisateur, telles que les contrôleurs et les services de domaine.
6. `app/infrastructure/persistence/repositories/active_record_user_repository.rb` : Implémentation concrète du référentiel utilisateur en utilisant ActiveRecord pour la persistance.
7. `app/infrastructure/web/controllers/users_controller.rb` : Contrôleur responsable de la gestion des requêtes HTTP liées aux utilisateurs.
8. `app/infrastructure/web/views/users/` : Dossier contenant les vues (templates) pour afficher et gérer les utilisateurs.
9. `app/infrastructure/web/helpers/users/users_helper.rb` : Module de support pour les vues et les contrôleurs liés à la gestion des utilisateurs.
10. `config/database.yml` : Fichier de configuration de la base de données pour la couche d'infrastructure.
11. `db/migrate/` : Dossier contenant les fichiers de migration de la base de données pour la couche d'infrastructure.
12. `public/` : Dossier contenant les fichiers statiques accessibles publiquement, tels que les images, les styles CSS et les fichiers JavaScript.
13. `spec/domain/` : Dossier contenant les spécifications et les tests unitaires pour la couche de domaine.
14. `spec/application/` : Dossier contenant les spécifications et les tests d'intégration pour la couche d'application.
15. `spec/infrastructure/` : Dossier contenant les spécifications et les tests d'intégration pour la couche d'infrastructure.
16. `Gemfile` et `Gemfile.lock` : Fichiers contenant les dépendances du projet pour les bibli
