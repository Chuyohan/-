class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "세종대 동아리 소개 홈페이지에 오신걸 환영합니다!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def following
    @club  = current_user.club.build
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
