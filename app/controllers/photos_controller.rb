class PhotosController < ApplicationController
  def ocr
    @photo = Photo.new
  end

  def index
    @photos = Photo.all
  end

  def create
    @photo = Photo.create(photo_params)
    pic = Photo.ocr_search(@photo)
    redirect_to category_path(pic)
  end

  private

  def photo_params
    params.require(:photo).permit(:photo)
  end
end
