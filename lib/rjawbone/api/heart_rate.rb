module Rjawbone
  module API
    module HeartRate

      def heart_rate
        get_object(Rjawbone::HEARTRATE_ENDPOINT, Rjawbone::Model::List)
      end

    end
  end
end
