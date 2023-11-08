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
    image_id_to_delete = params[:image_id].to_i

    # Check if the current user is the owner of the photo
    if @photo.user == current_user
      # Find and delete the image by its ID or index
      if @photo.images[image_id_to_delete].present?
        @photo.images[image_id_to_delete].purge
        redirect_to @photo, notice: 'Image was successfully deleted.'
      else
        redirect_to @photo, alert: 'Image not found.'
      end
    else
      # If the current user is not the owner, handle this as needed
      redirect_to @photo, alert: 'You are not authorized to delete images from this photo.'
    end
  end

  def update
    @photo = Photo.find(params[:id])

    # Check if the current user is the owner of the photo
    if @photo.user == current_user
      # Start a transaction in case something fails
      ActiveRecord::Base.transaction do
        # Process any new images for attachment
        @photo.images.attach(params[:photo][:images]) if params[:photo][:images]

        # Update the photo's attributes
        raise ActiveRecord::Rollback unless @photo.update(photo_params.except(:images))

        redirect_to @photo, notice: 'Photo was successfully updated.'

        # Rollback the transaction if update fails
      end
    else
      # If the current user is not the owner, handle this as needed
      redirect_to @photo, alert: 'You are not authorized to edit this photo.'
    end
  end

  def edit
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
