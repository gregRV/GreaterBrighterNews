class Postrating < ActiveRecord::Base
  belongs_to :post
  has_one :user
end
