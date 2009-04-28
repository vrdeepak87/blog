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
@comments=Comment.find(:all, :conditions => ["blog_id = ?", @blog.id], :order => 'created_at DESC')
#@comments=Comment.paginate_by_blog_id @blog.id, :page => params[:page], :per_page => 10, :order => 'created_at DESC'
@user = User.find_by_id(session[:uid])

if(session[:uid])
@temp=checkuser(@blog.user_id,@user.id)
end
end

def new
@blog=Blog.new
@user=User.find_by_id(session[:uid])
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

def checkuser(blogid,userid)
blogid == userid
end


def edit
@blog=Blog.find(params[:id])
@user=User.find_by_id(session[:uid])
end

def update
@blog = Blog.find(params[:id])
	if @blog.update_attributes(params[:blog])
        	flash[:info] = 'Blog was successfully updated.'
		redirect_to :action => "list"
	end
end

def delete
@blog=Blog.find(params[:id])
var1=@blog.id
Comment.destroy_all(["blog_id = ?", var1])
@blog.destroy
redirect_to :action => 'list'
end


def newcomment
@comment=Comment.new
end


def addcomment
@comment=Comment.create!(params[:comment])
	respond_to do |format|
		format.html {redirect_to :action => 'show', :id => @comment.blog_id}
		format.js
	end

end

def deletecomment
@comment=Comment.find(params[:id])
blog_id=@comment.blog_id
@comment.destroy
@user=User.find_by_id(session[:uid])
@comments=Comment.find(:all, :conditions => ["blog_id = ?", blog_id], :order => 'created_at DESC')

	respond_to do |format|
		format.html {redirect_to :action => 'show', :id => blog_id}
		format.js 
	end
end

end
