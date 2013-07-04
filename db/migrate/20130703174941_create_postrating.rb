class CreatePostrating < ActiveRecord::Migration
  def change
    create_table :postratings do |t|
      t.integer :rating, default: 0
      t.references :post
      t.references :user
    end
  end
end
