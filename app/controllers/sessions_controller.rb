class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to movies_path, notice: "Welcome back, #{user.firstname}!"
      @true_session = user.id
    else
      flash.now[:alert] = "Log in failed..."
      render :new
    end
  end

  def destroy
    if mimicing?
        session[:user_id] = session[:admin_id]
        session[:admin_id] = nil
        redirect_to :back, notice: "Admin again!"
    else
      session[:user_id] = nil
      redirect_to movies_path, notice: "Adios!"
    end
  end

end