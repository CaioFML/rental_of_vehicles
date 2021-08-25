module Fipe
  class Request
    class UnexpectedResponse < StandardError; end

    URL = "https://parallelum.com.br/fipe/api/v1/carros".freeze

    class << self
      def brands
        response = HTTParty.get("#{URL}/marcas")

        Rails.logger.info response

        raise UnexpectedResponse unless response.success?

        JSON.parse(response.body)
      end

      def models(brand_id)
        response = HTTParty.get("#{URL}/marcas/#{brand_id}/modelos")

        raise UnexpectedResponse unless response.success?

        JSON.parse(response.body)
      end
    end
  end
end
