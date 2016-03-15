module Rjawbone
  # Base endpoints
  JAWBONE_URL = "https://jawbone.com"
  BASE_ENDPOINT = "#{JAWBONE_URL}/nudge/api/v.1.1"
  USER_ENDPOINT = "#{BASE_ENDPOINT}/users/@me"

  # Move endpoints
  USER_MOVES = "#{USER_ENDPOINT}/moves"
  MOVES_ENDPOINT = "#{BASE_ENDPOINT}/moves"

  # Heart Rate endpoints
  HEARTRATE_ENDPOINT = "#{USER_ENDPOINT}/heartrates"

  # Sleep endpoints
  USER_SLEEPS = "#{USER_ENDPOINT}/sleeps"
  SLEEPS_ENDPOINT = "#{BASE_ENDPOINT}/sleeps"

  # Authentication endpoints
  OAUTH_BASE = "#{JAWBONE_URL}/auth/oauth2"
  AUTHORIZATION_URL = "#{OAUTH_BASE}/auth"
  TOKEN_URL = "#{OAUTH_BASE}/token"
end
