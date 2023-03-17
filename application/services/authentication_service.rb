# Requiert les dépendances nécessaires pour les mots de passe sécurisés
require 'bcrypt'

# Définition de la classe AuthenticationService
class AuthenticationService
  # Méthode pour créer un mot de passe sécurisé à partir d'un mot de passe en clair
  def self.encrypt_password(plain_password)
    BCrypt::Password.create(plain_password)
  end

  # Méthode pour vérifier si un mot de passe en clair correspond à un mot de passe sécurisé
  def self.password_matches?(plain_password, hashed_password)
    BCrypt::Password.new(hashed_password) == plain_password
  end

  # Méthode pour authentifier un utilisateur en fonction de son email et de son mot de passe
  def authenticate(email, plain_password)
    user_repository = UserRepository.new
    user = user_repository.find_by_email(email)

    if user && AuthenticationService.password_matches?(plain_password, user.password)
      user
    else
      nil
    end
  end
end
