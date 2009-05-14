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
   		 get :show, :id => '1'
    		 assert_not_nil assigns(:blog)
    		 assert_equal blogs(:blog_test1).title, assigns(:blog).title
    		 assert_valid assigns(:blog)
    	end


	
end
