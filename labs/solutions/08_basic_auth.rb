# --------------------------
# Lab 08: Add basic authentication [ 08_add_basic_authentication.rb ]
# --------------------------
# Protect the destroy and edit in the CommentsController with Basic Auth
# Protect everything except show/index in the PostsController with Basic Auth
# --------------------------

# add a private method called 'authenticate' to ApplicationController

    private
      def authenticate
        authenticate_or_request_with_http_basic do |user, pass|
        user == "admin" && pass == "password"
      end

# add a before_filter to the CommentsController

    class CommentsController < ApplicationController
      before_filter :authenticate, :only => [:destroy, :edit]
    end

# add a before_filter to the CommentsController 

    class PostsController < ApplicationController
      before_filter :authenticate, :except => [:show, :index]
    end

# test the protected actions in a browser to make sure they're... protected.
 
