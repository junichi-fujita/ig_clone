class AccountsController < ApplicationController
  before_action :login_required

  def like_pictures
    @pictures = current_user.voted_pictures.order("votes.created_at DESC")
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.assign_attributes(account_params)
    if @user.save
      redirect_to account_path(@user), notice: "登録内容を変更しました。"
    else
      render "edit"
    end
  end

  private

  def account_params
    params.require(:account).permit(
      :name,
      :email,
      :new_profile_picture,
      )
  end
end
