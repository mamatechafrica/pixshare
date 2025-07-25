class SearchController < ApplicationController
  def index
    if params[:query].present?
      @photos = Photo.search(params[:query]).records
    else
      @photos = []
    end
  end
end
