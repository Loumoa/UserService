# Requiert les dépendances nécessaires
require 'sinatra'
require 'sinatra/namespace'
require 'sinatra/json'
require_relative 'config/application'

# Chargement des fichiers de l'application
Dir.glob('./{domain,interfaces,application}/**/*.rb').each { |file| require file }

# Configuration et connexion à la base de données
db_config = YAML.load_file('config/database.yml')
ActiveRecord::Base.establish_connection(db_config[ENV['RACK_ENV'] || 'development'])

# Classe App qui hérite de Sinatra::Base
class App < Sinatra::Base
  register Sinatra::Namespace

  # Configuration CORS pour autoriser les requêtes depuis n'importe quelle origine
  use Rack::Cors do
    allow do
      origins '*'
      resource '*', headers: :any, methods: %i[get post put delete options]
    end
  end

  # Création d'un espace de noms pour l'API (version 1)
  namespace '/api/v1' do
    # Route pour récupérer tous les utilisateurs
    get '/users' do
      # Instanciez le UserRepository
      user_repository = UserRepository.new

      # Récupérez tous les utilisateurs depuis le UserRepository
      users = user_repository.all

      # Convertissez les utilisateurs en JSON et renvoyez la réponse
      json users.map { |user| user.attributes }
    end

    # Route pour récupérer un utilisateur par ID
    get '/users/:id' do
      user_repository = UserRepository.new
      user = user_repository.find(params[:id])

      if user
        json user.attributes
      else
        status 404
        json({ error: 'User not found' })
      end
    end

    # Route pour créer un nouvel utilisateur
    post '/users' do
      user_repository = UserRepository.new
      user = user_repository.create(params)

      if user.valid?
        status 201
        json user.attributes
      else
        status 422
        json({ error: user.errors.full_messages })
      end
    end

    # Route pour mettre à jour un utilisateur existant
    put '/users/:id' do
      user_repository = UserRepository.new
      user = user_repository.find(params[:id])

      if user
        user.update_attributes(params)
        json user.attributes
      else
        status 404
        json({ error: 'User not found' })
      end
    end

    # Route pour supprimer un utilisateur
    delete '/users/:id' do
      user_repository = UserRepository.new
      user = user_repository.find(params[:id])

      if user
        user_repository.destroy(user)
        status 204
      else
        status 404
        json({ error: 'User not found' })
      end
    end
  end
end

# Exécution de l'application
run App.run!