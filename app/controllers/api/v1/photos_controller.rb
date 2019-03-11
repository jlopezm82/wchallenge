class Api::V1::PhotosController < ApplicationController

  API_ENDPOINT = 'https://jsonplaceholder.typicode.com'.freeze
  PHOTOS_PATH = '/photos'.freeze

  def index
    patron_session = Patron::Session.new
    patron_session.base_url = API_ENDPOINT

    service_response = patron_session.get(PHOTOS_PATH)

    # url = "#{PHOTOS_PATH}?_page=#{params["_page"]}"
    # service_response = patron_session.get(url)

    if service_response.status < 400
      @photos = Oj.load(service_response.body)
    end

    render 'index'
  end

end
