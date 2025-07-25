class PhotosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    if params[:user_id]
      @photos = Photo.where(user_id: params[:user_id]).order(created_at: :desc)
    else
      @photos = Photo.all.order(created_at: :desc)
    end
  end


  def show
    @comment = Comment.new
    @comments = @photo.comments.includes(:user).order(created_at: :asc)
  end

  def new
    @photo = current_user.photos.build
  end

  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      redirect_to @photo, notice: "Photo was successfully uploaded."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @photo.update(photo_params)
      redirect_to @photo, notice: "Photo was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @photo.destroy
    redirect_to photos_path, notice: "Photo deleted."
  end

  def bulk_destroy
    Photo.where(id: params[:photo_ids]).find_each do |photo|
      photo.comments.destroy_all
      photo.destroy
    end
    redirect_back fallback_location: photos_path, notice: "Selected photos deleted"
  end


  private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def authorize_user!
    redirect_to @photo, alert: "Not authorized" unless @photo.user == current_user
  end

  def photo_params
    params.require(:photo).permit(:title, :description, images: [])
  end
end
