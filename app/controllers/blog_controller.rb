class BlogController < ApplicationController

def list
#@blogs=Blog.find(:all)
@blogs=Blog.paginate(:page => params[:page], :per_page => 5, :order => 'created_at DESC')
end

def show
@blog=Blog.find(params[:id])
end

def new
@blog=Blog.new
end

def create
  @blog=Blog.new(params[:blog])
  if @blog.save
    redirect_to :action => 'list'
  else
    render :action => 'new'
  end
end

end
