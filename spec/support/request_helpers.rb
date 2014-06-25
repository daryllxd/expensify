module Requests
  module JsonHelpers
    def json_response
      @json ||= JSON.parse(response.body)
    end

    def json_header
      { "Accept" => "application/json" }
    end
  end
end
