class SessionController < ApplicationController

def login
end

def check
session[:username]=params[:username]
session[:password]=params[:password]
flash[:notice]="Successfully logged in"
redirect_to :controller => 'blog', :action => 'list'
end

def logout
reset_session
flash[:notice]="You have logged out"
redirect_to :action => 'login'
end

end
