include CloudinaryHelper
require "google/cloud/vision"

class Photo < ApplicationRecord
  has_one_attached :photo

  def self.detect_text(file_name)
    puts file_name
    puts "----------------------------------------------------------------------------------------"
    image_annotator = Google::Cloud::Vision.image_annotator
    puts file_name
    response = image_annotator.text_detection(
      image: file_name,
      max_results: 1 # optional, defaults to 10
    )

    test = []
    response.responses.each do |res|
      res.text_annotations.each do |text|
        test << text.description
      end
      puts response
      return test[0].split("\n").first
    end
  end
end
