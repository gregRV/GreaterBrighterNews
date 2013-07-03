class Post < ActiveRecord::Base
  # Remember to create a migration!

  #validations

  belongs_to :user
  has_many :comments
end
