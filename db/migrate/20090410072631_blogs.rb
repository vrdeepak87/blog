class Blogs < ActiveRecord::Migration
  def self.up
    create_table :blogs do |t|
      t.column :title, :string
      t.column :description, :text
      t.column :id, :integer
      t.column :author, :text
      t.column :created_at, :timestamp
    end

  end

  def self.down
    drop_table :blogs
  end
end
