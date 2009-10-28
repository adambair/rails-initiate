# --------------------------
# Lab 06: Extract Post Form Fields
# --------------------------
# Create a partial that will contain extracted post form fields
# Extract common form fields from app/views/posts/edit.html.erb and new.html.erb
# Put the common fields into the partial
# Make sure that the forms still function
# --------------------------

# create an empty file called _post_fields.erb
# extract the following fields from app/views/posts/edit.html.erb and new.html.erb

  <%= f.error_messages %>

  <p>
    <%= f.label :title %><br />
    <%= f.text_field :title %>
  </p>
  <p>
    <%= f.label :author %><br />
    <%= f.text_field :author %>
  </p>
  <p>
    <%= f.label :body %><br />
    <%= f.text_area :body %>
  </p>

# In place of the extracted form fields render the partial

  <%= render :partial => 'post_fields', :locals => {:f => f} %>

# start your application and verify that the forms still function ;)
