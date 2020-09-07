class PhotosController < ApplicationController
  def ocr
    @photo = Photo.new
  end

  def index
    @photos = Photo.all
  end

  def create
    @photo = Photo.create(photo_params)
    redirect_to photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:photo)
  end
end
