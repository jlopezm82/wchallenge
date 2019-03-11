class Api::V1::UsersController < ApplicationController

  API_ENDPOINT = 'https://jsonplaceholder.typicode.com'.freeze
  USERS_PATH = '/users'.freeze

  def index
    patron_session = Patron::Session.new
    patron_session.base_url = API_ENDPOINT

    service_response = patron_session.get(USERS_PATH)

    if service_response.status < 400
      @users = Oj.load(service_response.body)
    end

    render 'index'
  end
end
