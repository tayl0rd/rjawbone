require "rjawbone/models/base"
require "rjawbone/models/list"
require "rjawbone/models/item"
require "rjawbone/models/details"

require "rjawbone/api/moves"
require "rjawbone/api/heart_rate"
require "rjawbone/api/sleeps"

module Rjawbone
  module API
    include Moves
    include HeartRate
    include Sleeps

  end
end
