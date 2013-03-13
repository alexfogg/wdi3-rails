<!DOCTYPE html>
<html>
<head>
  <title>R20130211Basics</title>
  <%= stylesheet_link_tag    "application", :media => "all" %>
  <%= javascript_include_tag "application" %>
  <%= csrf_meta_tags %>
</head>
<body>
  <nav>
    <a href="/home">Home</a>
</nav>
<%= yield %>

</body>
</html>
