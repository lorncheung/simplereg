# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_simple_session',
  :secret      => 'f8e5d6c0e71391d3f79f33e720aa56beb4db6f5c0f24aae00b112da55a0d83d50637780c15bdc053d5d402b95cf11cddd3db607701160e3f14bb333edcfcf163'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
