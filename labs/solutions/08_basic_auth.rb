# --------------------------
# Lab 08: Add basic authentication [ 08_add_basic_authentication.rb ]
# --------------------------
# Protect the destroy and edit actions in the CommentsController with Basic Auth
# Protect everything except show/index in the PostsController with Basic Auth
# --------------------------

# add a authentication filter to the CommentsController

    class CommentsController < ApplicationController
      http_basic_authenticate_with :name => "admin", :password => "password", 
        :only => [:destroy, :edit]
    end

# test the protected actions in a browser to make sure they're... protected.
 
