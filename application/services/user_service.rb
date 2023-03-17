# Requiert les dépendances nécessaires
require_relative '../entities/user'
require_relative '../value_objects/email'
require_relative '../repositories/user_repository'
require_relative 'authentication_service'

# Définition de la classe UserService
class UserService
  # Initialisation du service avec un dépôt d'utilisateurs
  def initialize
    @user_repository = UserRepository.new
  end

  # Méthode pour créer un nouvel utilisateur
  def create_user(first_name, last_name, email, plain_password, role = 'user')
    encrypted_password = AuthenticationService.encrypt_password(plain_password)
    user = User.new(first_name: first_name, last_name: last_name, email: Email.new(email), password: encrypted_password, role: role)
    @user_repository.save(user)
  end

  # Méthode pour récupérer tous les utilisateurs
  def get_all_users
    @user_repository.all
  end

  # Méthode pour récupérer un utilisateur par ID
  def get_user_by_id(id)
    @user_repository.find_by_id(id)
  end

  # Méthode pour mettre à jour les informations d'un utilisateur
  def update_user(id, new_attributes)
    user = @user_repository.find_by_id(id)

    if user
      new_attributes.each do |key, value|
        user.send("#{key}=", value) if user.respond_to?("#{key}=")
      end

      @user_repository.save(user)
    else
      nil
    end
  end

  # Méthode pour supprimer un utilisateur
  def delete_user(id)
    user = @user_repository.find_by_id(id)
    @user_repository.delete(user) if user
  end
end
