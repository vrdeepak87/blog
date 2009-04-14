class Comment < ActiveRecord::Base
validates_presence_of :description
belongs_to :blog
end
