class Api::V1::PostsController < ApplicationController

  def index
    service_response = get_patron_session.get(POSTS_PATH)

    if service_response.status < 400
      posts = Oj.load(service_response.body)
      @posts = posts.to_a.paginate(:page => params[:page], :per_page => 10)
    end

    render 'index'
  end

  def show
    patron_session = get_patron_session
    service_response = patron_session.get("#{POSTS_PATH}/#{params["id"]}")

    if service_response.status < 400
      @post = Oj.load(service_response.body)
    end

    if params["comment_name"].blank?
      service_response = patron_session.get("#{COMMENTS_PATH}?postId=#{params["id"]}")
    else
      service_response = patron_session.get("#{COMMENTS_PATH}?postId=#{params["id"]}&name=#{params["comment_name"]}")
    end

    if service_response.status < 400
      @comments = Oj.load(service_response.body)
    end

    render 'show'
  end
end
