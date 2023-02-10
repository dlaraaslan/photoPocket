class SaveAlbumsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    require 'open-uri'
    
    album_link = "https://jsonplaceholder.typicode.com/albums"
    response = HTTParty.get(album_link, verify: false)
    body = JSON.parse(response.body)

    body.each do |album|
      unless Album.where(title: album["title"]).present?
        @album = Album.new
        @album.title = album["title"]
        @album.user_id = album["userId"]
        @album.save
      end
    end
  
  end
end
