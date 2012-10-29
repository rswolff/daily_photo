class PhotosController < ApplicationController

  before_filter :require_login, :only => [:new, :create, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /photos
  # GET /photos.json
  def index

    @photos = Photo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new 

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit

  end

  # POST /photos
  # POST /photos.json
  def create

    respond_to do |format|
      if @photo.save
        format.html { redirect_to edit_photo_path(@photo), notice: 'Photo was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end

  def current
    @photo = Photo.current.first
  end

  def publish
    @photo = Photo.find(params[:photo_id])
    @photo.publish
    
    respond_to do |format|
      format.html {
        redirect_to edit_photo_path(@photo), notice: 'Photo was published.'
      }
    end

  end
end
