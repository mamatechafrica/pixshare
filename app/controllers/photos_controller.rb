class PhotosController < ApplicationController
  before_action :set_user, only: [:create]
  
  def index
    @photos = Photo.all # or Photo.where(some_condition) based on your requirements
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = @user.photos.build(photo_params)
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
    # Fetch the current user
    @user = current_user
  end

  def photo_params
    # Permit necessary attributes and the association with the user
    params.require(:photo).permit(:attribute1, :attribute2, :attribute3)
  end
end
