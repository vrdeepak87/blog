require 'test_helper'
require 'blog_controller'

class BlogController
   	def rescue_action(e) 
      		raise e 
   	end
end


class BlogControllerTest < ActionController::TestCase
	
fixtures :blogs
	def setup
    		@controller = BlogController.new
    		@request    = ActionController::TestRequest.new
    		@response   = ActionController::TestResponse.new
  	end

	def test_search_blog
   		 get :search, :title => 'Ruby Tutorial'
    		 assert_not_nil assigns(:blog)
    		 assert_equal books(:blog_test1).title, assigns(:blog).title
    		 assert_valid assigns(:blog)
    		 assert_redirected_to :action => 'show'
  	end


	def test_search_not_found
    		get :search, :title => 'HTML Tutorial'
    		assert_redirected_to :action => 'list'
    		assert_equal 'No such blog available', flash[:error]
  	end

	
end
