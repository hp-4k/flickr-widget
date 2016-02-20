module FlickrHelper
  
  def user_photos(user_id, photo_count = 12)
    flickr.people.getPublicPhotos(user_id: "43335486@N00").to_a[0...photo_count]
  end
  
  def render_flickr_sidebar_widget(user_id, photo_count = 12, columns = 2)
    #begin
      photos = user_photos(user_id, photo_count).in_groups_of(2)
      render partial: 'flickr/sidebar_widget', locals: { photos: photos }
    #rescue Exception
    #  render 'flickr/unavailable'
    #end
  end
  
  def build_url(photo)
    "http://farm#{photo.farm}.staticflickr.com/#{photo.server}/#{photo.id}_#{photo.secret}_s.jpg"
  end
  
  def build_show_url(photo)
    "https://www.flickr.com/photos/#{photo.owner}/#{photo.id}/"
  end
  
end