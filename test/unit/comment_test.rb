require 'test_helper'

class CommentTest < ActiveSupport::TestCase
 	def test_should_not_save_comment_with_all_blank_options 
	comment = Comment.new 
	assert !comment.save 
	end 

	def test_should_create_comment 
	comment = Comment.create :commenttor => "Test", :description => "Test description"
	assert comment.save
	end 
	
	def test_should_create_not_comment 
	comment = Comment.create :description => "Test description"
	assert !comment.save
	end 
end
