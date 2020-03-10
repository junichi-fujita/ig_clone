class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to :root, notice: "登録しました。"
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :new_profile_picture,
      :name,
      :email,
      :password,
      :password_confirmation,
    )
  end
end
