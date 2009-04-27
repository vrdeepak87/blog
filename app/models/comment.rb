class Comment < ActiveRecord::Base
validates_presence_of :commenttor
belongs_to :blog
belongs_to :user
end
