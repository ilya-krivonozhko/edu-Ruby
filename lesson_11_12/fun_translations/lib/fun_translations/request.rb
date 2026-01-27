# frozen_string_literal: true

module FunTranslations
  module Request
    include FunTranslations::Connection

    def post(path, client, params = {})
      # path --> translate/yoda.json
      # params = { text: "Hello my padawan!" }
      respond_with(
        connection(client).post(path, params) # строка, похожая на хэш
      )
    end

    private

    def respond_with(raw_response)
      body = if raw_response.body.empty?
               raw_response.body
             else
               JSON.parse(raw_response.body, symbolize_names: true)
             end
      respond_with_error(raw_response.status, body) if !raw_response.success?
      body[:contents]
    end

    def respond_with_error
      # ...
    end
  end
end
