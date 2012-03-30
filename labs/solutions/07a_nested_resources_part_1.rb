# --------------------------
# Lab 07a: Nested Resources Part 1 [ 07a_nested_resources_part_1.rb ]
# --------------------------
# Create a route that reflects the post has_many comments relationship
# Verify the routes using 'rake routes'
#
# Nest the CommentsController
# - Add a before filter to find the post from param[:post_id]
# - Hint: 
#
#   private
#     def find_post
#       Post.find(params[:post_id]
#     end
#
# - Only find and operate on comments scoped to the post found in the before filter
# - Hint:
#
#   @comment = @post.comments.find(params[:id])
#
# - Change redirects to the PostsController#show action
# --------------------------

# config/routes.rb

    resources :posts do
      resources :comments
    end

# rake routes should include some nested routes 
# see below for example output from "rake routes"

#     post_comments GET    /posts/:post_id/comments(.:format)          comments#index
#                   POST   /posts/:post_id/comments(.:format)          comments#create
#  new_post_comment GET    /posts/:post_id/comments/new(.:format)      comments#new
# edit_post_comment GET    /posts/:post_id/comments/:id/edit(.:format) comments#edit
#      post_comment GET    /posts/:post_id/comments/:id(.:format)      comments#show
#                   PUT    /posts/:post_id/comments/:id(.:format)      comments#update
#                   DELETE /posts/:post_id/comments/:id(.:format)      comments#destroy

# add a before_filter to the CommentsController app/controllers/comments_controller.rb

    class CommentsController
     before_filter :find_post

     private
       def find_post
         @post = Post.find(params[:post_id]
       end
    end

# scope all finds to @post (simple example)

    def new
      @comment = @post.comments.new
    end

# you can also create a before_filter for finding comments

    class CommentsController < ApplicationController
      before_filter :find_post
      before_filter :find_comment, :only => [:show, :edit, :update, :destroy]

      private
        def find_post
          @post = Post.find(params[:post_id])
        end

        def find_comment
          @comment = @post.comments.find(params[:id])
        end
    end

# change redirects 
    
  def create
    @comment = @post.comments.new(params[:comment])

    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to(@comment.post)
    else
      render :action => "new"
    end
  end

# finished controller should look something like this:
# (if you have respond_to blocks, that's okay!)

  class CommentsController < ApplicationController
    before_filter :find_post
    before_filter :find_comment, :only => [:show, :edit, :update, :destroy]

    def index
      @comments = @post.comments.all
    end

    def show
    end

    def new
      @comment = @post.comments.new
    end

    def edit
    end

    def create
      @comment = @post.comments.new(params[:comment])

      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
        redirect_to(@comment.post)
      else
        render :action => "new"
      end
    end

    def update
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        redirect_to(@comment)
      else
        render :action => "edit"
      end
    end

    def destroy
      @comment.destroy

      redirect_to(comments_url)
    end

    private
      def find_post
        @post = Post.find(params[:post_id])
      end

      def find_comment
        @comment = @post.comments.find(params[:id])
      end
  end

  
