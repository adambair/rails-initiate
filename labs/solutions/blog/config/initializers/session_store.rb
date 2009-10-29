# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_awesome_blog_session',
  :secret      => '2d1513f1a9c638c2978d2638b8d6087325268fa0c2f3232cbe7d496386973760a29fd50e13eb8131cf010a88529b66e27f505f1f809919f113b50aba6c64ff38'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
