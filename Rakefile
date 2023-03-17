require 'sinatra/activerecord/rake'
require './config/application'

# Chargement des fichiers de l'application
Dir.glob('./{domain,interfaces,application}/**/*.rb').each { |file| require file }

# Configuration et connexion à la base de données
db_config = YAML.load_file('config/database.yml')
ActiveRecord::Base.establish_connection(db_config[ENV['RACK_ENV'] || 'development'])

# Chargement des tâches Rake pour ActiveRecord
load 'sinatra/activerecord/rake.rb'

# Définition d'une tâche pour démarrer l'application
desc 'Start the application'
task :start do
  sh 'rackup'
end

# Définition d'une tâche pour exécuter les tests (si vous utilisez RSpec)
desc 'Run tests'
task :test do
  sh 'rspec'
end
