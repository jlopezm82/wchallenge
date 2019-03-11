class Api::V1::AlbumsController < ApplicationController

  API_ENDPOINT = 'https://jsonplaceholder.typicode.com'.freeze
  ALBUMS_PATH = '/albums'.freeze
  PHOTOS_PATH = '/photos'.freeze

  def index
    patron_session = Patron::Session.new
    patron_session.base_url = API_ENDPOINT

    service_response = patron_session.get(ALBUMS_PATH)

    if service_response.status < 400
      @albums = Oj.load(service_response.body)
    end

    render 'index'
  end

  def show
    patron_session = Patron::Session.new
    patron_session.base_url = API_ENDPOINT

    service_response = patron_session.get("#{PHOTOS_PATH}?albumId=#{params["id"]}")

    if service_response.status < 400
      @photos = Oj.load(service_response.body)
    end

    render 'show'
  end

  def show_by_user
    patron_session = Patron::Session.new
    patron_session.base_url = API_ENDPOINT

    service_response = patron_session.get("#{ALBUMS_PATH}?userId=#{params["user_id"]}")

    if service_response.status < 400
      @albums = Oj.load(service_response.body)
    end

    render 'index'
  end
end
