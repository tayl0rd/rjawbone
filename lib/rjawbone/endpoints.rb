module Rjawbone

  # Base endpoints
  JAWBONE_URL = "https://jawbone.com"
  BASE_ENDPOINT = "#{JAWBONE_URL}/nudge/api/v.1.1"
  USER_ENDPOINT = "#{BASE_ENDPOINT}/users/@me"

  ENDPOINTS = [
    :band_events,
    :body_events,
    :heartrates,
    :goals,
    :meals,
    :mood,
    :moves,
    :settings,
    :sleeps,
    :timezone,
    :trends,
    :friends,
  ]

  # Two constants are created for every endpoint:
  # NAME_USER and NAME_ENDPOINT
  #
  # NAME_USER has the /users/@me syntax
  # NAME_ENDPOINT has just the base_endpoint syntax
  ENDPOINTS.each do |sym|
    const_set("#{sym.upcase}_USER", "#{USER_ENDPOINT}/#{sym}" )
    const_set("#{sym.upcase}_ENDPOINT", "#{BASE_ENDPOINT}/#{sym}")
  end

  # Authentication endpoints
  OAUTH_BASE = "#{JAWBONE_URL}/auth/oauth2"
  AUTHORIZATION_URL = "#{OAUTH_BASE}/auth"
  TOKEN_URL = "#{OAUTH_BASE}/token"
end
