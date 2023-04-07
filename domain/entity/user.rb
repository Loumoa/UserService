class User
  attr_accessor :id, :name, :email, :password, :phone, :user_type

  def initialize(id, name, user_type, email, password, phone)
    @id = id
    @name = name
    @user_type = user_type
    @email = email
    @password = password
    @phone = phone
  end

  def to_hash
    {
      id: @id,
      name: @name,
      email: @email,
      password: @password,
      phone: @phone,
      user_type: @user_type
    }
  end
end
