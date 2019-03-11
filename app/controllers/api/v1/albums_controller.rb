class Api::V1::AlbumsController < ApplicationController

  def index
    service_response = get_patron_session.get(ALBUMS_PATH)

    if service_response.status < 400
      albums = Oj.load(service_response.body)
      @albums = albums.to_a.paginate(:page => params[:page], :per_page => 10)
    end

    render 'index'
  end

  def show
    service_response = get_patron_session.get("#{PHOTOS_PATH}?albumId=#{params["id"]}")

    if service_response.status < 400
      photos = Oj.load(service_response.body)
      @photos = photos.to_a.paginate(:page => params[:page], :per_page => 20)
    end

    render 'show'
  end

  def show_by_user
    service_response = get_patron_session.get("#{ALBUMS_PATH}?userId=#{params["user_id"]}")

    if service_response.status < 400
      albums = Oj.load(service_response.body)
      @albums = albums.to_a.paginate(:page => params[:page], :per_page => 10)
    end

    render 'index'
  end
end
