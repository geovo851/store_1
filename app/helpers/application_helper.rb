module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type
    when "success"
      "alert-success"   # Green
    when "error"
      "alert-danger"    # Red
    when "alert"
      "alert-warning"   # Yellow
    when "notice"
      "alert-info"      # Blue
    else
      flash_type.to_s
    end
  end

  def find_role_admin
    User.select('users.name, roles.title').joins(:role).where('roles.title = ?', 'admin').first
  end
end
