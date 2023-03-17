# Définition de la classe Role comme objet valeur
class Role
    # Les rôles disponibles pour les utilisateurs
    ADMIN = 'admin'
    USER = 'user'
  
    # La liste des rôles valides
    VALID_ROLES = [ADMIN, USER].freeze
  
    attr_reader :value
  
    # Méthode d'initialisation pour créer un objet Role
    def initialize(value)
      # Vérifie si le rôle donné est valide
      raise ArgumentError, 'Invalid role' unless VALID_ROLES.include?(value)
  
      @value = value
    end
  
    # Méthode pour vérifier l'égalité entre deux objets Role
    def ==(other)
      other.is_a?(Role) && other.value == value
    end
  
    # Méthode pour convertir l'objet Role en chaîne de caractères (String)
    def to_s
      value
    end
  end
  