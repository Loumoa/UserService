class User
    attr_accessor :id, :first_name, :last_name, :email, :password, :role
  
    def initialize(id, first_name, last_name, email, password, role)
      @id = id
      @first_name = first_name
      @last_name = last_name
      @email = email
      @password = password
      @role = role
    end
  
    def full_name
      "#{first_name} #{last_name}"
    end
  
    def update_attributes(attributes)
      @first_name = attributes[:first_name] if attributes[:first_name]
      @last_name = attributes[:last_name] if attributes[:last_name]
      @email = attributes[:email] if attributes[:email]
      @password = attributes[:password] if attributes[:password]
      @role = attributes[:role] if attributes[:role]
    end
  
    def valid?
      validate_presence_of(:first_name, :last_name, :email, :password, :role) && validate_email_format
    end
  
    private
  
    def validate_presence_of(*attributes)
      attributes.all? { |attribute| !send(attribute).nil? && !send(attribute).strip.empty? }
    end
  
    def validate_email_format
      email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
      !!(email =~ email_regex)
    end
  end
  