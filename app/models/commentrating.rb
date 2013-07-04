class Commentrating < ActiveRecord::Base
  belongs_to :comment
  has_one :user
end
