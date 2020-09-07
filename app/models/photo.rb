class Photo < ApplicationRecord
   has_one_attached :photo
require "google/cloud/vision"

def ocr_search(photo)

image_annotator = Google::Cloud::Vision.image_annotator

file_name = photo

response = image_annotator.text_detection(
  image:       file_name,
  max_results: 3
)

response.responses.each do |res|
  res.text_annotations.each do |text|
    puts text.description
  end
end

