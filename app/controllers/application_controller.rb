class ApplicationController < ActionController::Base
  # for APIs better to use :null_session instead.
  protect_from_forgery with: :exception
end
