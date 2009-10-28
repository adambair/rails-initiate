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
