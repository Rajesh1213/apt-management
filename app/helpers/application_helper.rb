module ApplicationHelper

  def generate_activity_user_labels
    label_title = ''

    case current_user.role.name
    when "tenant"
      label_title = "Active Tenant"
    when "assistant"
      label_title = "Assistant"
    when "supervisor"
      label_title = "Supervisor"
    when "manager"
      label_title = "Manager"
    end

    html_labels = '<span class="label label-success">' + label_title + '</span>'.html_safe
  end

  def user_role
    current_user.role.name unless current_user.nil? || current_user.role.nil?
  end

  def user_dashboard_url
    dashboards_path + "/" + user_role unless user_role == "unassigned role"
  end

  def user_message
    force_user_profile!
    logger.debug "Hello form logger"
  end

  def force_user_profile!
    case user_role
    when "tenant"
      if current_user.tenant.nil?
        flash[:notice] = %Q[<h4>Fill Out Your Profile</h4><p>Please make sure to fill out your tenant information, before proceeding</p><a href='#{new_tenant_path}' class='btn btn-sm btn-default'>Edit Details &rsaquo;</a>]
      end
    end
  end
end
