class Api::V1::UsersController < ApplicationController

  def index
    service_response = get_patron_session.get(USERS_PATH)

    if service_response.status < 400
      users = Oj.load(service_response.body)
      @users = users.to_a.paginate(:page => params[:page], :per_page => 10)
    end

    render 'index'
  end
end
