# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rails-contributors_session',
  :secret      => 'd71338a50b826f6cbbf6bfed542aa00018494e6880be54c633aa6454064c5a9ca1801840a56d84f2ffd4e308bada966bed4ed17e8335c2f11462294a481f1166'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
