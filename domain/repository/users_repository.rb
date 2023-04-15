require_relative '../entity/user'
require 'pg'

class UserRepository

  def self.connect
    PG.connect(dbname: 'userInfosArchiDesSi', user: 'authenticator', password: 'archiDesSi1234', host: 'thibaulthenrion.com', port: '5432')
  end

  def self.add(param)
    conn = connect
    result = conn.exec_params("INSERT INTO utilisateur (prénom, nom, mail, motDePasse, adresse) VALUES ($1, $2, $3, $4, $5) RETURNING idUtilisateur", [param[:prenom], param[:nom], param[:mail], param[:motDePasse], param[:adresse]])
    id = result[0]['idUtilisateur'].to_i
    user = User.new(id, param[:prenom], param[:nom], param[:mail], param[:motDePasse], param[:adresse])
    conn.close
    user
  end

  def self.get_all
    conn = connect
    result = conn.exec('SELECT * FROM utilisateur')
    users = result.map { |row| User.new(row['idUtilisateur'].to_i, row['prénom'], row['nom'], row['mail'], row['motDePasse'], row['adresse']) }
    conn.close
    users.map(&:to_hash)
  end

  def self.get(id)
    conn = connect
    result = conn.exec_params("SELECT * FROM utilisateur WHERE idUtilisateur = $1", [id])
    user = result.map { |row| User.new(row['idUtilisateur'].to_i, row['prénom'], row['nom'], row['mail'], row['motDePasse'], row['adresse']) }.first
    conn.close
    user
  end

  def self.update(id, param)
    conn = connect
    result = conn.exec_params("UPDATE utilisateur SET prénom = $1, nom = $2, mail = $3, motDePasse = $4, adresse = $5 WHERE idUtilisateur = $6 RETURNING idUtilisateur", [param[:prenom], param[:nom], param[:mail], param[:motDePasse], param[:adresse], id])
    updated_id = result[0]['idUtilisateur'].to_i
    user = User.new(updated_id, param[:prenom], param[:nom], param[:mail], param[:motDePasse], param[:adresse])
    conn.close
    user
  end

  def self.delete(id)
    conn = connect
    conn.exec_params("DELETE FROM utilisateur WHERE idUtilisateur = $1", [id])
    conn.close
  end
end
