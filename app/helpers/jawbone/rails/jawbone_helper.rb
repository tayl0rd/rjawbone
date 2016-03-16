module Jawbone
  module Rails
    module JawboneHelper

      def jawbone_url
        Rjawbone::Oauth.authorization_url
      end

    end
  end
end
