# Requiert la dépendance ActiveRecord
require 'active_record'

# Définition de la classe UserRepository
class UserRepository
  # Crée un nouvel utilisateur dans la base de données
  def create(user)
    user_record = UserRecord.create(
      first_name: user.first_name,
      last_name: user.last_name,
      email: user.email,
      password_digest: user.password,
      role: user.role
    )
    user.id = user_record.id
    user
  end

  # Trouve un utilisateur par son identifiant (id)
  def find(id)
    user_record = UserRecord.find_by(id: id)
    user_from_record(user_record)
  end

  # Trouve un utilisateur par son adresse e-mail
  def find_by_email(email)
    user_record = UserRecord.find_by(email: email)
    user_from_record(user_record)
  end

  # Met à jour un utilisateur existant dans la base de données
  def update(user)
    user_record = UserRecord.find(user.id)
    user_record.update(
      first_name: user.first_name,
      last_name: user.last_name,
      email: user.email,
      password_digest: user.password,
      role: user.role
    )
    user
  end

  # Supprime un utilisateur de la base de données par son identifiant (id)
  def delete(id)
    UserRecord.find(id).destroy
  end

  # Méthodes privées

  private

  # Convertit un enregistrement UserRecord en objet User
  def user_from_record(user_record)
    return nil unless user_record

    User.new(
      user_record.id,
      user_record.first_name,
      user_record.last_name,
      user_record.email,
      user_record.password_digest,
      user_record.role
    )
  end
end

# Définition de la classe UserRecord qui hérite d'ActiveRecord::Base
class UserRecord < ActiveRecord::Base
  # Spécifie le nom de la table dans la base de données
  self.table_name = 'users'
end