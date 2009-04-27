class Blog < ActiveRecord::Base
validates_presence_of :description
belongs_to :user
has_many :comments
end
