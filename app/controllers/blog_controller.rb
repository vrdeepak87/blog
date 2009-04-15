class BlogController < ApplicationController

def list
@blogs=Blog.paginate(:page => params[:page], :per_page => 5, :order => 'created_at DESC')
#Storing all the blogs in the instance variable.Paginate does the job of "find".
end

def show
@blog=Blog.find(params[:id])
#Searching a particular blod using "id" and storing it in @blog
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

end
