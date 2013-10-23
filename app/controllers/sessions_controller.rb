class SessionsController < ApplicationController
  def new
  end
  def create
  	admin = Admin.authenticate(params[:username], params[:password])
  	if admin
  		session[:user] = admin
  		redirect_to root_url, :notice => "Welcome #{admin.username}"
  	else
  		# flash[:notice] = "Wrong username and password combination"
  		# render "new"
  		redirect_to new_session_path, :notice => "Wrong username and password combination"
  	end
  end
  def destroy
  	session[:user] = nil
  	redirect_to root_url
  end
end
