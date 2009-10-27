# --------------------------
# Lab 05: Post Comment Association
# --------------------------
# Create a migration that adds a 'post_id' field to the comments table
# Create a has_many relationship between the Post and Comment models
# Verify the relationship through the Rails console
# --------------------------

# ruby script/generate migration add_post_id_to_comments 
# edit db/migrate/timestamp_add_post_id_to_comments
# in self.up

  add_column :comments, :post_id, :integer
 
# in self.down

  remove_column :comments, :post_id

# rake db:migrate
# edit app/models/post.rb

  class Post < ActiveRecord::Base
    has_many :comments
  end

# edit app/models/comment.rb

  class Comment < ActiveRecord::Base
    belongs_to :post
  end

# test the association in the console
# ruby script/console

  # you can test the association on existing posts
  Post.first.comments  #=> should be an empy array []

  # you can also test the association with new objects
  # create a post and a comment 
  post = Post.create(:title => 'a blog post', :body => 'body of a blog post')
  comment = Comment.create(:author => 'jack', :body => 'body of a comment')

  # assign the post to the comment
  comment.post = post
  comment.save
  
  # test the association
  comment.post          #=> should be the post we associated
  post.comments         #=> should be an array containing the comment

