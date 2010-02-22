# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_garvin_docs_session',
  :secret      => '60581372186aca530841657637283da477dc99c11e31638dd5f1d3b5d952001be9e75b86cea129ebdb5bbd787b750b3cea79f11eff30b6b67290c135762da9d9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
