require_relative '../../domain/repository/users_repository'
require_relative '../../domain/entity/user'

class UserService
  def self.add(params)
    user = User.new(nil, params[:name], params[:user_type], params[:email], params[:password], params[:phone])
    UserRepository.add(user)
    user
  end

  def self.get_all
    UserRepository.get_all
  end

  def self.get(id)
    UserRepository.get(id)
  end

  def self.update(id, params)
    user = UserRepository.get(id)
    return nil unless user

    user.name = params[:name] || user.name
    user.email = params[:email] || user.email
    user.password = params[:password] || user.password
    user.phone = params[:phone] || user.phone
    user.user_type = params[:user_type] || user.user_type

    UserRepository.update(user)
    user
  end

  def self.delete(id)
    UserRepository.delete(id)
  end
end
