class User < ActiveRecord::Base
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true
  validates :name, :presence => true
  validates_length_of :password, :in => 8..20, :on => :create

  before_save :encrypt_password
	
  self.per_page = 15
  
  def self.set_per_page(number)
    self.per_page = number
  end

  def self.authenticate(username="", login_password="")
    user = User.find_by_username(username)

    if user && user.match_password(login_password)
      return user
    else
      return false
    end
  end   

  def match_password(login_password="")
    encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end

	def encrypt_password
	  if password.present?
	    self.salt = BCrypt::Engine.generate_salt
	    self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
	  end
	end
end
