require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'] || 'development')

# Chargement des fichiers de l'application
require_relative 'config/application'
Dir.glob('./{domain,interfaces,application}/**/*.rb').each { |file| require file }

# Configuration et connexion à la base de données
db_config = YAML.load_file('config/database.yml')
ActiveRecord::Base.establish_connection(db_config[ENV['RACK_ENV'] || 'development'])

# Configuration de l'API
class Api < Sinatra::Base
  register Sinatra::Namespace

  use Rack::Cors do
    allow do
      origins '*'
      resource '*', headers: :any, methods: %i[get post put delete options]
    end
  end

  namespace '/api/v1' do
    use Interfaces::Api::V1::UsersController
  end
end

# Lancement de l'API
run Api
