require 'test_helper'

class CommentTest < ActiveSupport::TestCase
 	fixtures :comments
		def test_comment
			test_comment = Comment.new :description => comments(:comment_test1).description,
				:blog_id => comments(:comment_test1).blog_id,
				:commenttor => comments(:comment_test1).commenttor,
				:created_at => comments(:comment_test1).created_at
			assert test_comment
		
			assert test_comment.save

		end
end
