class Api::V1::UsersController < ApplicationController

  def index
    service_response = get_patron_session.get(USERS_PATH)

    if service_response.status < 400
      @users = Oj.load(service_response.body)
    end

    render 'index'
  end
end
