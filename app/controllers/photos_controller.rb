class PhotosController < ApplicationController
  def ocr
    @photo = Photo.new
  end

  def index
    @photos = Photo.all
  end

  def create
    @photo = Photo.new
  end
end
