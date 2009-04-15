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
		redirect_to :controller => 'Comment', :action => 'listcomment', :id => @comment.blog_id
	else 
		#action to be performed on failure
		redirect_to :controller => 'Comment', :action => 'newcomment', :id => @comment.blog_id
	end
	end

end
