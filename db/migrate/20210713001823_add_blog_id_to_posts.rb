class AddBlogIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :blog, null: false, foreign_key: true
  end
end
