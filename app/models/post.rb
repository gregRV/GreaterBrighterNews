class Post < ActiveRecord::Base
  # Remember to create a migration!

  #validations
  validates_length_of :body, :maximum =>150

  belongs_to :user
  has_many :comments
  has_one :postrating
end
