require 'rjawbone/models/heart_rate'

module Rjawbone
  module API
    module HeartRate

      include Rjawbone::Utils

      def heart_rate
        perform_get_with_object(Rjawbone::HEARTRATE_ENDPOINT, 
                                auth_header,
                                Rjawbone::Model::HeartRate::List)
      end

    end
  end
end
