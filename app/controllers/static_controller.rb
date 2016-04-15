class StaticController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def index
    @title = "Homepage"
    @hello = "title"
  end

  def about

  end

  def contact

  end
end
