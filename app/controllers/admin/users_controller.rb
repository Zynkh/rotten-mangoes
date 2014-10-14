class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: "Successfully created, #{@user.firstname}!"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    UserMailer.fuckyou_email(@user).deliver
    @user.destroy
    redirect_to admin_users_path
  end

  def switch
    @user = User.where(admin: [false, nil]).find(params[:id])
    session[:admin_id] = current_user.id
    session[:user_id] = @user.id
    redirect_to movies_path, notice: "Switched"
    @@preview = true
  end

  def switch_back

    @@preview = false
  end

  protected

   def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :admin)
  end
end
