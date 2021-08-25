RSpec.describe Fipe::Request do
  describe "#brands" do
    subject(:brands) { described_class.brands }

    context "when response code is 200" do
      it "parses response body" do
        VCR.use_cassette("get_brands", match_requests_on: %i[method uri body], erb: { http_code: 200 }) do
          expect(brands.first).to eq({ "codigo" => "1", "nome" => "Acura" })
        end
      end
    end

    context "when response code is different than 200" do
      it do
        VCR.use_cassette("get_brands", match_requests_on: %i[method uri body], erb: { http_code: 500 }) do
          expect { brands }.to raise_error Fipe::Request::UnexpectedResponse
        end
      end
    end
  end

  describe "#models" do
    subject(:models) { described_class.models(brand_id) }

    let(:brand_id) { 1 }

    context "when response code is 200" do
      it "parses response body" do
        VCR.use_cassette("get_models", match_requests_on: %i[method uri body], erb: { http_code: 200 }) do
          expect(models["modelos"].first).to eq({ "nome" => "Integra GS 1.8", "codigo" => 1 })
          expect(models["anos"].first).to eq({ "nome" => "1998 Gasolina", "codigo" => "1998-1" })
        end
      end
    end

    context "when response code is different than 200" do
      it do
        VCR.use_cassette("get_models", match_requests_on: %i[method uri body], erb: { http_code: 500 }) do
          expect { models }.to raise_error Fipe::Request::UnexpectedResponse
        end
      end
    end
  end
end
