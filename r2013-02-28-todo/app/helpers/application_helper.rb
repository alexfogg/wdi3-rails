module ApplicationHelper
  def intellinav
    links = ""

    if @auth.present?
      # links += "<li>#{link_to('Edit', edit_users_path)}</li>"
      links += "<li>#{link_to(@auth.name, login_path, :method => :delete, :confirm => "Are you sure?")}</li>"
      links +="<li>#{link_to('Priorities', priorities_path)}</li>"
      links +="<li>#{link_to('Tasks', tasks_path)}</li>"
    else
      "<li>#{link_to('Create Account', new_user_path)}</li>" +
      "<li>#{link_to('Login', login_path)}</li>"
    end
  end
end
