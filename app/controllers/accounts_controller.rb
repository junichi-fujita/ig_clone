class AccountsController < ApplicationController
  before_action :login_required

  def show
    @user = current_user
  end

  def edit
  end

  private

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(
      :text,
      :image, 
      :image_cache,
      :user_id
      )
  end
end
