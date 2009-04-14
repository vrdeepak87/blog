class CommentController < ApplicationController

	def listcomment
	@blog=Blog.find(params[:id])
	@comments=@blog.comments
	end

	def newcomment
	@blog=Blog.find(params[:id])
	@comment=Comment.new
	end

	def create
	@comment=Comment.new(params[:comment])
	if @comment.save
		redirect_to :controller => 'Comment', :action => 'listcomment'
	else 
		render :controller => 'comment', :action => 'newcomment'
	end
	end

end
