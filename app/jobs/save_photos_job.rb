class SavePhotosJob < ApplicationJob
  queue_as :default

  def perform(*args)

    album_link = "https://jsonplaceholder.typicode.com/photos"
    response = HTTParty.get(album_link, verify: false)
    body = JSON.parse(response.body)

    body.each do |photo|
      @photo = Photo.new
      @photo.title = photo["title"]
      @photo.url = photo["url"]
      @photo.thumbnail_url = photo["thumbnailUrl"]
      @photo.album_id = photo["albumId"]
      @photo.save

    end

  end
end
