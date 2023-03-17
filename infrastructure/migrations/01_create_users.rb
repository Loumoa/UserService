# Requiert la dépendance ActiveRecord nécessaire pour les migrations
require 'active_record'

# Définition de la classe CreateUser qui hérite de ActiveRecord::Migration
class CreateUser < ActiveRecord::Migration[6.0]
  # Méthode pour définir les actions à effectuer lors de l'application de la migration
  def up
    # Crée la table users avec les colonnes spécifiées
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :role, null: false, default: 'user'

      # Ajoute des colonnes created_at et updated_at pour enregistrer les horodatages de création et de mise à jour
      t.timestamps
    end

    # Ajoute un index unique sur la colonne email pour éviter les doublons
    add_index :users, :email, unique: true
  end

  # Méthode pour définir les actions à effectuer lors de l'annulation de la migration
  def down
    # Supprime la table users
    drop_table :users
  end
end