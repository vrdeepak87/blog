class CommentController < ApplicationController

	def listcomment
	  @blog=Blog.find(params[:id])
	  @comments=@blog.comments #Storing all the comments wrt the particular blog in @comments
	end

	def newcomment
	  @blog=Blog.find(params[:id])
	  @comments=@blog.comments #Storing all the comments wrt the particular blog in @comments
	end

	def create
	  @comment=Comment.new(params[:comment])
	  if @comment.save
	  #action to be performed on a successive save

	  respond_to do |format| #will respond according to the request format it gets.
	
	    format.html {redirect_to :controller => 'Comment', :action => 'listcomment', :id => @comment.blog_id} #Performs the following action incase of a html request.
	
	    format.js #Performs the following action incase on js request.
	    end
	
	  else 
		#action to be performed on failure
		redirect_to :controller => 'Comment', :action => 'newcomment', :id => @comment.blog_id
	  end
	end

end
