class PhotosController < ApplicationController
  skip_before_action :authenticate_user!
  def ocr
    @photo = Photo.new
  end

  def index
    @photos = Photo.all
  end

  def create
    @photo = Photo.create(photo_params)
    file_name = view_context.cl_image_path(@photo.photo.key)
    pic = Photo.detect_text(file_name)
    redirect_to photo_search_path(pic)
  end

  def photo_search
    @coffees = Coffee.global_search(params[:pic])
  end

  private

  def photo_params
    params.require(:photo).permit(:photo)
  end
end
