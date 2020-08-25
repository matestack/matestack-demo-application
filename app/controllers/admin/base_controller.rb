class Admin::BaseController < ApplicationController
  include Admin::Components::Registry
  matestack_app Admin::App

  layout 'administration'
  before_action :authenticate_admin!
end
