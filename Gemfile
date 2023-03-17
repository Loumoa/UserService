source 'https://rubygems.org'

ruby '3.1.3' # Spécifiez la version de Ruby que vous utilisez

gem 'sinatra'          # Le framework Sinatra pour construire l'API
gem 'sinatra-contrib'  # Extensions utiles pour Sinatra
gem 'activerecord'     # Le ORM ActiveRecord pour interagir avec la base de données
gem 'sinatra-activerecord' # Intégration de Sinatra avec ActiveRecord
gem 'rake'             # Outil pour exécuter des tâches, comme les migrations de la base de données
gem 'pg'               # Pilote PostgreSQL pour ActiveRecord
gem 'bcrypt'           # Pour sécuriser les mots de passe des utilisateurs
gem 'rack-cors'        # Middleware pour gérer les requêtes CORS

group :development do
  gem 'pry'            # Outil de débogage pour le développement
  gem 'tux'            # Console Sinatra pour le développement
end

group :test do
  gem 'rspec'          # Framework de test pour Ruby
  gem 'rack-test'      # Outil de test pour les applications Rack
end
