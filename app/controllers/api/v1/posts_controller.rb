class Api::V1::PostsController < ApplicationController

  API_ENDPOINT = 'https://jsonplaceholder.typicode.com'.freeze
  POSTS_PATH = '/posts'.freeze
  COMMENTS_PATH = '/comments'.freeze

  def index
    patron_session = Patron::Session.new
    patron_session.base_url = API_ENDPOINT

    service_response = patron_session.get(POSTS_PATH)

    if service_response.status < 400
      @posts = Oj.load(service_response.body)
    end

    render 'index'
  end

  def show
    patron_session = Patron::Session.new
    patron_session.base_url = API_ENDPOINT

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
