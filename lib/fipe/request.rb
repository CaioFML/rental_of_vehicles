module Fipe
  class Request
    class UnexpectedResponse < StandardError; end

    URL = "http://fipeapi.appspot.com/api/1/carros".freeze

    class << self
      def brands
        response = HTTParty.get("#{URL}/marcas.json")

        raise UnexpectedResponse unless response.success?

        JSON.parse(response.body)
      end

      def models(brand_id)
        response = HTTParty.get("#{URL}/veiculos/#{brand_id}.json")

        raise UnexpectedResponse unless response.success?

        JSON.parse(response.body)
      end
    end
  end
end
