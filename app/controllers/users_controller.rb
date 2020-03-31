class UsersController < ApplicationController
  skip_before_action :login_required
  before_action :set_user, only: [:show, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
  end

  def edit
      if User.find(params[:id]) == current_user
        @user = User.find(current_user.id)
      else
        redirect_to pictures_path, notic:"人のIDは編集できません"
      end
  end
  
  def update
    if @user.update(user_params)
      redirect_to user_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
  end

  def set_user
    @user = User.find(params[:id])     
  end
end