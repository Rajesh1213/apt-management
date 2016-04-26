class DashboardsController < ApplicationController

  before_action :validate_role
  before_action :force_profile

  def index

  end

  def supervisor
    title = "Supervisor"
  end

  def tenant
    title = "Welcome tenant."
  end

  def manager
    title = "Welcome manager"
  end

  def assistant
    title = "Welcome assistant"
  end


  private
  def validate_role
    if Role.pluck(:name).include?(current_user.role.name) && current_user.role.name != action_name
      redirect_to action: current_user.role.name.to_s
    end
  end
end
