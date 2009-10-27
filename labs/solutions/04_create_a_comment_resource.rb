# --------------------------
# Lab 04: Create a Comment Resource
# --------------------------
# Use scaffolding to create a Comment resource with author and body fields
# Extra Credit: Don't use scaffolding (generators are allowed)
# Verify your new resource in a browser
# --------------------------

# ruby script/generate scaffold Comment author:string body:text
# rake db:migrate
# ruby script/server
# Open http://localhost:3000/comments in a browser
# Click around to make sure that everything works

# Extra Credit
# Build the functionality above using only the model and controller generators
# Reference the Post resource for assistence
