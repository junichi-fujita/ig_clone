class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :destroy]

  def index
    @pictures = Picture.all
  end

  def show

  end

  def new
    @picture = Picture.new
  end

  def edit

  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user = current_user
    if params[:back]
      render "top/home"
    else
      if @picture.save
        IgmailerMailer.contact_mail(@picture.user).deliver
        redirect_to pictures_path, notice: "画僧を投稿しました。"
      else
        render "new"
      end
    end
  end

  def update
    
  end

  def destroy

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
