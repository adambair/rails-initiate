class CommentsController < ApplicationController
  before_filter :find_post
  before_filter :find_comment, :only => [:show, :edit, :update, :destroy]
  http_basic_authenticate_with :name => "admin", :password => "password", 
    :only => [:destroy, :edit]
  

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
      redirect_to([@post, @comment])
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

