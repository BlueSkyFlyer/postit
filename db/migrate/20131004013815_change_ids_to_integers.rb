class ChangeIdsToIntegers < ActiveRecord::Migration
  def change
  	change_column :posts, :user_id, :integer 
  	change_column :comments, :user_id, :integer
  	change_column :comments, :post_id, :integer
  end
end
