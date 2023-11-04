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

  # Add a new action to handle photo deletion
  def destroy
    @photo = Photo.find(params[:id])

    # Check if the current user is the owner of the photo
    if @photo.user == current_user
      # Remove the photo from the database
      @photo.destroy
      redirect_to photos_path, notice: 'Photo was successfully deleted.'
    else
      # If the current user is not the owner, you can handle this as you see fit
      redirect_to @photo, alert: 'You are not authorized to delete this photo.'
    end
  end

  private

  def set_user
    @user = current_user
  end

  def photo_params
    params.require(:photo).permit(:title, :description, images: [])
  end
end
