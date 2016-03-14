module Rjawbone
  JAWBONE_URL = "https://jawbone.com"
  BASE_ENDPOINT = "#{JAWBONE_URL}/nudge/api/v.1.1"

  USER_ENDPOINT = "#{BASE_ENDPOINT}/users/@me"
  USER_MOVES = "#{USER_ENDPOINT}/moves"
  MOVES_ENDPOINT = "#{BASE_ENDPOINT}/moves"

  OAUTH_BASE = "#{JAWBONE_URL}/auth/oauth2"
  AUTHORIZATION_URL = "#{OAUTH_BASE}/auth"
  TOKEN_URL = "#{OAUTH_BASE}/token"
end
