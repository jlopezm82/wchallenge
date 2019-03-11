class Api::V1::PhotosController < ApplicationController

  def index
    service_response = get_patron_session.get(PHOTOS_PATH)

    if service_response.status < 400
      photos = Oj.load(service_response.body)
      @photos = photos.to_a.paginate(:page => params[:page], :per_page => 48)
    end

    render 'index'
  end

end
