# --------------------------
# Lab 07b: Nested Resources Part 2 [ 07b_nested_resources_part_2.rb ]
# --------------------------
# List all comments associated with a post in app/views/posts/show.html.erb
# Add a comment form to app/views/posts/show.html.erb
# - You can steal the one from app/views/comments/new.html.erb
# - Make sure to update the form to use the proper nested route
# - Hint: 
#
#   <% form_for :comment, :url => post_comments_path(@post) do |f| %>
#
# Test your comment form to make sure you can add new comments
# --------------------------

# List all comments when viewing a post

    <h2>Comments</h2>
    <% @post.comments.each do |comment| %>
      <div class='comment'>
        <p><%= comment.author %> - Commented <%= distance_of_time_in_words_to_now(comment.created_at) %> ago</p>
        <p><%= comment.body %></p>
      </div>
      <hr/>
    <% end %>
  
# in app/views/posts/show.html.erb add a comment form

    <h3>Add a comment!</h3>
    <%= form_for [@post, Comment.new] do |f| %>
      <p>
        <%= f.label :author %><br />
        <%= f.text_field :author %>
      </p>
      <p>
        <%= f.label :body %><br />
        <%= f.text_area :body %>
      </p>

      <%= f.hidden_field :post_id, :value => @post.id %>

      <p>
        <%= f.submit 'Comment' %>
      </p>
    <% end %>

