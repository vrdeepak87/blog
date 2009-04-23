class BlogController < ApplicationController

before_filter :authorize, :except => [:list, :show]

def list
@user = User.find_by_id(session[:uid])
@blogs=Blog.paginate(:page => params[:page], :per_page => 5, :order => 'created_at DESC')
#Storing all the blogs in the instance variable.Paginate does the job of "find".
end

def show
@blog=Blog.find(params[:id])
#Searching a particular blod using "id" and storing it in @blog
@comments=@blog.comments
#@comments=Comment.find(@blog.id, :order => 'created_at DESC')
@user = User.find_by_id(session[:uid])
end
def new
@blog=Blog.new
end

def create
  @blog=Blog.new(params[:blog])
  if @blog.save
    #action to be performed on a successive save 
    redirect_to :action => 'list'
  else
    #action to be performed on a failure
    render :action => 'new'
  end
end

def newcomment
@comment=Comment.new
end

=begin
def addcomment
	  @comment=Comment.new(params[:comment])
if @comment.save
	  #action to be performed on a successive save
		respond_to do |format|
		format.html {redirect_to :action => 'show', :id => @comment.blog_id}
		format.js
		end
else 
		#action to be performed on failure
		@blog = @comment.blog
		#render :action => 'show', :id => @comment.blog_id
	  end
end
=end


def addcomment
@comment=Comment.create!(params[:comment])
	respond_to do |format|
		format.html {redirect_to :action => 'show', :id => @comment.blog_id}
		format.js
	end

end


end
