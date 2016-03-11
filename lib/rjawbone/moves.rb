module Rjawbone
  module Moves

    include Rjawbone::Utils

    MOVES = "#{Rjawbone::USER_ENDPOINT}/moves"

    def move_list
      perform_get_with_object(MOVES, auth_header, Rjawbone::Move)
    end

    def build_params(params)
      return if params.empty?
      url_params = {}

      page = params[:page]
      url_params.merge!({:page_token => page}) if page

      date = params[:date]
      date = set_date unless date
      url_params.merge!({:date => date})
    end

  end
end
