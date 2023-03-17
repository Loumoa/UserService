# Définition de la classe ChangeRoleCommand
class ChangeRoleCommand
    # Initialisation de l'objet avec l'ID de l'utilisateur, le nouveau rôle et une instance de UserRepository
    def initialize(user_id, new_role, user_repository)
      @user_id = user_id
      @new_role = new_role
      @user_repository = user_repository
    end
  
    # Méthode d'exécution pour mettre à jour le rôle d'un utilisateur
    def execute
      # Trouver l'utilisateur avec l'ID donné en utilisant le UserRepository
      user = @user_repository.find(@user_id)
  
      # Retourne nil si l'utilisateur n'est pas trouvé
      return nil unless user
  
      # Met à jour le rôle de l'utilisateur avec la nouvelle valeur
      user.update_attributes(role: @new_role)
      
      # Enregistre l'utilisateur mis à jour dans UserRepository
      @user_repository.update(user)
  
      # Retourne l'utilisateur mis à jour
      user
    end
  end
  