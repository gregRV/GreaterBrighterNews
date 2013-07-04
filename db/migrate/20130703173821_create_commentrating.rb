class CreateCommentrating < ActiveRecord::Migration
  def change
    create_table :commentratings do |t|
      t.integer :rating, default: 0
      t.references :comment
      t.references :user
    end
  end
end
