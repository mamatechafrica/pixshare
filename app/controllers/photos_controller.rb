class PhotosController < ApplicationController
  before_action :set_user, only: [:create]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = @user.photos.build(photo_params)
    @photo.images.attach(params[:photo][:images]) # This attaches the uploaded image

    if @photo.save
      redirect_to @photo, notice: 'Photo was successfully created.'
    else
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  private

  def set_user
    @user = current_user
  end

  def photo_params
    params.require(:photo).permit(:title, :description, images: [])
  end
end
