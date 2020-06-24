class UsersController < ApplicationController
  before_action :authenticate, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:edit, :update, :destroy]

  def show
    @user = User.includes(:reviews).find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login @user
      redirect_to root_path, notice: 'User created successfuly'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User updated successfuly'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to login_path, notice: 'User deleted successfuly'
  end

  private
    
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :full_name, :photo, :cover_image)
    end
end
