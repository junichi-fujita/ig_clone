class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to :pictures
    else
      flash.alert = "名前とパスワードが一致しません。"
      redirect_to :root
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to :root
  end
end
