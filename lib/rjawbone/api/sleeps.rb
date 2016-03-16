module Rjawbone
  module API
    module Sleeps

      def sleep_list
        get_object(Rjawbone::SLEEPS_USER, Rjawbone::Model::List)
      end

    end
  end
end
