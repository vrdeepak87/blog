class AddUserid < ActiveRecord::Migration
  def self.up
	add_column :blogs, :user_id, :integer
	add_column :blogs, :username, :string
	add_column :comments, :user_id, :integer
	add_column :comments, :username, :string
  end

  def self.down
	
	remove_column :comments, :username
	remove_column :comments, :user_id
	remove_column :blogs, :username
	remove_column :blogs, :user_id
  end
end
