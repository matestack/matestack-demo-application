class Admin::BaseController < ApplicationController
  before_action :authenticate_admin!
  helper_method :current_admin
end
