class Photo < ApplicationRecord
  has_one_attached :photo

  def self.detect_text(photo)
    require "google/cloud/vision"

    image_annotator = Google::Cloud::Vision.image_annotator

    file_name = photo.photo.service_url

    response = image_annotator.text_detection(
      image: file_name,
      max_results: 1 # optional, defaults to 10
    )
    test = []
    response.responses.each do |res|
      res.text_annotations.each do |text|
        test << text.description
      end
      return test[0].split("\n").first
    end
  end
end
