class SessionController < ApplicationController

  def register
    if request.post?
      @user = User.new params[:user]
      if @user.save
	redirect_to :action => 'login'
        flash[:info] = 'You are registered now'

      end    	
    end
  end

  def login
    if request.post?
      @user = User.find_by_username(params[:login])
	if @user and @user.password_is? params[:password]
	   session[:uid] = @user.id
           redirect_to :controller => 'blog', :action => 'list'
	else 
	   redirect_to :action => 'login'
	   flash[:info] = 'Wrong username or password'
	end
    end
  end


  def logout
    session[:uid] = nil
    flash[:info] = 'You\'re logged out'
    redirect_to :controller => 'session', :action => 'login'
  end


end
