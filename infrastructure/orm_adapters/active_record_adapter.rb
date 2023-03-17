# Requiert les dépendances nécessaires pour utiliser ActiveRecord
require 'active_record'

# Définition de la classe ActiveRecordAdapter
class ActiveRecordAdapter
  # Initialisation de l'adaptateur avec un modèle ActiveRecord et une entité de domaine
  def initialize(active_record_model, domain_entity)
    @active_record_model = active_record_model
    @domain_entity = domain_entity
  end

  # Méthode pour créer une nouvelle instance de l'entité de domaine à partir d'un modèle ActiveRecord
  def to_domain_entity(record)
    @domain_entity.new(record.attributes)
  end

  # Méthode pour créer une nouvelle instance du modèle ActiveRecord à partir d'une entité de domaine
  def to_active_record_entity(entity)
    @active_record_model.new(entity.attributes)
  end

  # Méthode pour mettre à jour les attributs d'un modèle ActiveRecord à partir d'une entité de domaine
  def update_active_record_entity(active_record_entity, domain_entity)
    active_record_entity.update_attributes(domain_entity.attributes)
  end
end
