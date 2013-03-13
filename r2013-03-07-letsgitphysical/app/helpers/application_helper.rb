module ApplicationHelper
    def intellinav
    links = ""

    if @auth.present?
      links += "<li>#{link_to(@auth.email, login_path, :method => :delete, :class => 'button alert', :confirm => "Are you sure?")}</li>"
      links +="<li>#{link_to('Users', users_path)}</li>"
      links +="<li>#{link_to('Exercises', exercises_path)}</li>"
    else
      "<li>#{link_to('Create Account', new_user_path)}</li>" +
      "<li>#{link_to('Login', login_path)}</li>"
    end
  end
end
