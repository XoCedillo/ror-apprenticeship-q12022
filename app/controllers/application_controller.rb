class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :authenticate_user!, except: %i[ show index ]
end
