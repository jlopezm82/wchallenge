class ApplicationController < ActionController::Base

  API_ENDPOINT = 'https://jsonplaceholder.typicode.com'.freeze
  USERS_PATH = '/users'.freeze
  ALBUMS_PATH = '/albums'.freeze
  PHOTOS_PATH = '/photos'.freeze
  POSTS_PATH = '/posts'.freeze
  COMMENTS_PATH = '/comments'.freeze

  def get_patron_session
    patron_session = Patron::Session.new
    patron_session.base_url = API_ENDPOINT
    patron_session
  end
end
