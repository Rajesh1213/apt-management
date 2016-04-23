class StaticController < ApplicationController
  include ApplicationHelper

  skip_before_filter :authenticate_user!
  before_action :user_message, only: [ :index ]

  def index
    @title = "Homepage"
    @hello = "title"

  end

  def about
    
  end

  def contact

  end

  def staff_login

  end

  def new_staff

  end
end
