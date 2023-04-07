require_relative '../entity/user'

class UserRepository
  @@users = [
    User.new(1, 'John', 'proprio', 'email', 'password', '01'),
    User.new(2, 'Janette', 'locataire', 'email', 'password', '01'),
    User.new(3, 'Jack', 'proprio', 'email', 'password', '01'),
  ]

  def self.add(user)
    user.id = @@users.length + 1
    @@users << user
  end

  def self.get_all
    @@users.map(&:to_hash)
  end

  def self.get(id)
    user = @@users.find { |user| user.id == id }
    user&.to_hash
  end

  def self.update(user)
    @@users[user.id - 1] = user
  end

  def self.delete(id)
    @@users.delete_if { |user| user.id == id }
  end
end
