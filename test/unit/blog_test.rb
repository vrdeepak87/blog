require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  	
  fixtures :blogs

  	def test_blog

    		test_blog = Blog.new :title => blogs(:blog_test1).title, 
                         :description => blogs(:blog_test1).description,
   			 :username => blogs(:blog_test1).username,
                         :created_at => blogs(:blog_test1).created_at,
			 :id => blogs(:blog_test1).id

    		assert test_blog
		
		assert test_blog.save
		
		test_blog_copy = Blog.find(test_blog.id)

		assert_equal test_blog.title, test_blog.title

		test_blog.title = "Ruby Tutorial"

		assert test_blog.destroy

  	end

end

