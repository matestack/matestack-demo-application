class Admin::BaseController < ApplicationController
  include Admin::Components::Registry

  layout 'administration'
  before_action :authenticate_admin!
end
