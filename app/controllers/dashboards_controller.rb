class DashboardsController < ApplicationController

  #before_action :validate_role

  def index

  end

  def supervisor
    title = "Supervisor"
  end

  def tenant
    title = "Welcome tenant."
  end

  private
  def validate_role
    if Role.pluck(:name).include?(current_user.role.name)
      redirect_to action: current_user.role.name.to_s
    end
  end
end
