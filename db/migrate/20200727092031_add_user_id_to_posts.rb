class AddUserIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :user, index: true, foreign_key: true, after: :id
  end
end
