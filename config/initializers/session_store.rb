# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_garvin_docs_session',
  :secret      => '89920c80745dbb1a0af1de17befd18f20eaf4f18ad4240ceea76330d5a16c4186fe680f3bb957fd90548c2bad83af3f2bb3db46ffd6cc82e0bf259735363f85a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
