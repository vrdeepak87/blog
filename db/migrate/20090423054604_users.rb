class Users < ActiveRecord::Migration
  def self.up
	create_table :users do |t|
	t.column :username :string
	t.column :password 
	end 
  end

  def self.down
	drop_table :users
	end
  end
end
