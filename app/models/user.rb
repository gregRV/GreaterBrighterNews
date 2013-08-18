include BCrypt

class User < ActiveRecord::Base
  #TODO : Use bcrypt to store hashed passwords and authenticate users
  validates :name, :email, :password, presence: true
  validates :email, :format => {:with =>/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/, :message => "Invalid Email" }
  validates :email, uniqueness: true

  has_many :posts
  has_many :comments
  has_many :postratings
  has_many :commentratings

  def password
  	@password ||= Password.new(password_hash)
  end

  def password=(new_password)
  	@password = Password.create(new_password)
  	self.password_hash = @password
  end

  def self.authenticate(email,password)
  	@user = User.find_by_email(email)
  	if @user
  		return @user
    else
      nil
    end
  end
end
