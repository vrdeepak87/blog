require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  	
	def test_should_not_save_blog_without_description 
	blog = Blog.new 
	assert !blog.save 
	end 

	def test_should_create_blog 
	blog = Blog.create :title => "Test title", :description => "Test description"
	assert blog.save
	end 
	
	def test_should_not_create_blog_with_empty_description 
	blog = Blog.create :title => "Test title"
	assert !blog.save
	end 

	def test_should_create_blog_with_all_blank_options_except_description 
	blog = Blog.create :description => "Test description"
	assert blog.save
	end 
	
end
