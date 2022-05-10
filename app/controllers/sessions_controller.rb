class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      puts user.inspect
      session[:user_id] = user.id
      redirect_to '/', notice: 'LOGGED IN'
      
    # @user = User.find_by_email(params[:email])

    # if @user && @user.authenticate(params[:password])
    #   session[:user_id] = @user.id
    #   redirect_to '/', notice: 'LOGGED IN'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/login'
  end
end
