class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! ,except: [:show, :index]
  def index
    @images = Album.find(params[:album_id]).images
  end

  def show
  end

  def new
    @album = Album.find(params[:album_id])
    @image = @album.images.new()
  end

  def edit
    @album = Album.find(params[:album_id])
    @image = Image.find(params[:id])
  end

  # POST /images
  # POST /images.json
  def create
    @album = Album.find(params[:album_id])
    @image = @album.images.new(image_params)
    respond_to do |format|
      if @image.save
        format.html { redirect_to  album_images_path, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        if @image.errors.messages[:album] == ["is invalid", "is invalid"]
          @image.errors.delete(:album)
          @image.errors.add(:album,"not contain more than 25 images.")
        end   
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to  album_images_path, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:tag_line, :photo)
    end
end
