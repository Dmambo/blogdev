class ChangeUserIdColumnInPosts < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :user_id, :integer, null: true
  end
end
