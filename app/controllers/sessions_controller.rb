class SessionsController < ApplicationController
  def new
  end

  def create
  	 user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "세종대 동아리들입니다!"
      redirect_to all_show_path
    else
      flash.now[:danger] = '이메일 또는 비밀번호가 틀렸습니다.'
      render "static_page/home"
    end
  end

  def create_facebook
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    flash[:success] = "세종대 동아리들입니다!"
    redirect_to all_show_path
  end

  def destroy
  	log_out
    session[:user_id] = nil
    redirect_to root_path
  end

end
