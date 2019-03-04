class HomeController < ApplicationController
  def index
    @lastes_images = Image.last(25).reverse
  end
  def all_albums
   @albums = Album.all.reverse
  end

  def albums_images
    @images= Album.find(params[:format]).images
  end  
end
