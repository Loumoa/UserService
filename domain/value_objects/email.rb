# Requiert la dépendance nécessaire pour la validation des e-mails
require 'uri'
require 'mail'

# Définition de la classe Email comme objet valeur
class Email
  attr_reader :value

  # Méthode d'initialisation pour créer un objet Email
  def initialize(value)
    # Vérifie si l'email donné est valide
    raise ArgumentError, 'Invalid email' unless valid_email?(value)

    @value = value
  end

  # Méthode pour vérifier l'égalité entre deux objets Email
  def ==(other)
    other.is_a?(Email) && other.value == value
  end

  # Méthode pour convertir l'objet Email en chaîne de caractères (String)
  def to_s
    value
  end

  private

  # Méthode privée pour vérifier la validité d'un e-mail
  def valid_email?(email)
    parsed_email = Mail::Address.new(email)
    domain_part = parsed_email.domain
    local_part = parsed_email.local
    domain_and_local_present = domain_part.present? && local_part.present?
    domain_and_local_present && domain_part.match?(URI::MailTo::EMAIL_REGEXP) && local_part.match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  rescue Mail::Field::ParseError
    false
  end
end