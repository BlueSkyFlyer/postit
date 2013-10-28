class RemoveAndAddIntegerColumns < ActiveRecord::Migration
  def change
  	remove_column :posts, :user_id, :integer 
  	remove_column :comments, :user_id, :integer
  	remove_column :comments, :post_id, :integer

  	add_column :posts, :user_id, :integer 
  	add_column :comments, :user_id, :integer
  	add_column :comments, :post_id, :integer
  end
end
