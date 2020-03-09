class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy, :like]

  def index
    @pictures = Picture.order(updated_at: :desc)
    # @picture = current_user.pictures.build
  end

  def show
  end

  def new
    if params[:back]
      @picture = current_user.pictures.build(picture_params)
    else
      @picture = current_user.pictures.build
    end
  end

  def edit
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if params[:back]
      render "new"
    else
      if @picture.save
        IgmailerMailer.contact_mail(@picture).deliver
        redirect_to pictures_path, notice: "画像を投稿しました。"
      else
        render "new"
      end
    end
  end

  def update
    @picture.assign_attributes(picture_params)
    if @picture.save
      redirect_to @picture, notice: "投稿を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @picture.destroy
    redirect_to :pictures, notice: "投稿を削除しました。"
  end

  def confirm
    # @pictures = Picture.order(updated_at: :desc)
    @picture = current_user.pictures.build(picture_params)
    render "new" if @picture.invalid?
  end

  def like
    current_user.voted_pictures << @picture
    redirect_to :pictures
  end

  def unlike
    current_user.voted_pictures.destroy(set_picture)
    redirect_to :pictures
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
