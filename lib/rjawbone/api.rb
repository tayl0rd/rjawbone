require "rjawbone/models/base"

require "rjawbone/api/move_list"
require "rjawbone/models/move_list"
require "rjawbone/api/move"
require "rjawbone/models/move"

module Rjawbone
  module API
    include MoveList
    include Move

  end
end
