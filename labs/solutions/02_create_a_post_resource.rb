# --------------------------
# Lab 02: Create a Post Resource [ 02_create_a_post_resource.rb ]
# --------------------------
# Use the scaffold generator to create a Post resource
# The Post should have a title, body, and author fields
# Use the rake command to migrate your database
# Start your application and explore the freshly minted scaffold at /posts
# --------------------------

# ruby script/generate Post title:string author:string body:text
# rake db:migrate
# ruby script/server
# Open http://localhost:3000/posts in a browser
# Explore!
