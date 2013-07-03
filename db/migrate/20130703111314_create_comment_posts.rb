class CreateCommentPosts < ActiveRecord::Migration
  def change
    create_table :commentposts do |t|
      t.references :post
      t.references :comment
    end
  end
end
