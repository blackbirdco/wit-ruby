module Wit
  class Client
    attr_accessor :token

    def initialize(token)
      @token = token
    end

    def classify_message(message = '')
      response = connection.get do |req|
        req.headers['Authorization'] = "Bearer #{token}"
        req.url '/message', q: message
      end

      case response.status
        when 200 then return Result.new JSON.parse(response.body)
        when 401 then raise Unauthorized, "incorrect token"
        else raise BadResponse, "response code: #{response.status}"
      end
    end

    private

    def connection
      @connection ||= Faraday.new url: 'https://api.wit.ai' do |faraday|
        faraday.adapter Faraday.default_adapter
      end
    end
  end
end
