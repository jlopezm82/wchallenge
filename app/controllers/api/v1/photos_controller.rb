class Api::V1::PhotosController < ApplicationController

  def index
    service_response = get_patron_session.get(PHOTOS_PATH)

    # url = "#{PHOTOS_PATH}?_page=#{params["_page"]}"
    # service_response = patron_session.get(url)

    if service_response.status < 400
      @photos = Oj.load(service_response.body)
    end

    render 'index'
  end

end
