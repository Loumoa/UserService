require_relative '../entity/user'
require 'pg'

class UserRepository

  def self.connect
    PG.connect(dbname: 'userInfosArchiDesSi', user: 'authenticator', password: 'archiDesSi1234', host: 'thibaulthenrion.com', port: '5432')
  end

  def self.add(param)
    conn = connect
    result = conn.exec("INSERT INTO users (name, user_type, email, password, phone) VALUES (#{params[:name]}, #{params[:user_type]}, #{params[:email]}, #{params[:password]}, #{params[:phone]}) RETURNING id")
    id = result[0]['id'].to_i
    user = User.new(id, param[:name], param[:user_type], param[:email], param[:password], param[:phone])
    conn.close
    user
  end

  def self.get_all
    conn = connect
    result = conn.exec('SELECT * FROM users')
    users = result.map { |row| User.new(row['id'].to_i, row['name'], row['user_type'], row['email'], row['password'], row['phone']) }
    conn.close
    users.map(&:to_hash)
  end

  def self.get(id)
    conn = connect
    result = conn.exec("SELECT * FROM users WHERE id = #{id}")
    user = result.map { |row| User.new(row['id'].to_i, row['name'], row['user_type'], row['email'], row['password'], row['phone']) }.first
    conn.close
    user
  end

  def self.update(param)
    conn = connect
    result = conn.exec("UPDATE users SET name = #{params[:name]}, user_type = #{params[:user_type]}, email = #{params[:email]}, password = #{params[:password]}, phone = #{params[:phone]} WHERE id = #{id} RETURNING id")
    updated_id = result[0]['id'].to_i
    user = User.new(updated_id, param['name'], param['user_type'], param['email'], param['password'], param['phone'])
    conn.close
    user
  end

  def self.delete(id)
    conn = connect
    conn.exec("DELETE FROM users WHERE id = #{id.to_s}")
    conn.close
  end
end
