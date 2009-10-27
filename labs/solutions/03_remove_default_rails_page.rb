# --------------------------
# Lab 03: Remove Default Rails Page [ 03_remove_default_rails_page.rb ]
# --------------------------
# Remove the default Rails landing page (Welcome to Rails)
# Create a route that will display all of your Posts at localhost:3000/
# --------------------------

# Delete public/index.html
# Add 'map.root :controller => 'posts' to config/routes.rb
# ruby script/server
# Open http://localhost:3000/ in a browser
# Verify that '/' shows all of your posts
