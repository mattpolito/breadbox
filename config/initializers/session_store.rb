# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bread_box_session',
  :secret      => 'b8b04982222f52ccc587b306f6cbac2781d7120db2acb1661e190950a95e478a8344d264e8f3b2360eccaf85139f814ff34bc5c319ec93f2fe9132c213a56628'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
