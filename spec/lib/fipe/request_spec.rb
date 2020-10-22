RSpec.describe Fipe::Request do
  let(:response) { OpenStruct.new(code: 200, body: "{}".to_json, success?: true) }

  describe "#brands" do
    subject(:brands) { described_class.brands }

    context "when response code is 200" do
      it "parses response body" do
        expect(HTTParty)
          .to receive(:get).with("http://fipeapi.appspot.com/api/1/carros/marcas.json").and_return(response)

        expect(brands).to eq "{}"
      end
    end

    context "when response code is different than 200" do
      let(:response) { OpenStruct.new(code: 500, body: "{}") }

      it do
        expect(HTTParty)
          .to receive(:get).with("http://fipeapi.appspot.com/api/1/carros/marcas.json").and_return(response)

        expect { brands }.to raise_error Fipe::Request::UnexpectedResponse
      end
    end
  end

  describe "#models" do
    subject(:models) { described_class.models(brand_id) }

    let(:brand_id) { 6 }

    context "when response code is 200" do
      it "parses response body" do
        expect(HTTParty)
          .to receive(:get)
          .with("http://fipeapi.appspot.com/api/1/carros/veiculos/#{brand_id}.json")
          .and_return(response)

        expect(models).to eq "{}"
      end
    end

    context "when response code is different than 200" do
      let(:response) { OpenStruct.new(code: 500, body: "{}") }

      it do
        expect(HTTParty)
          .to receive(:get)
          .with("http://fipeapi.appspot.com/api/1/carros/veiculos/#{brand_id}.json")
          .and_return(response)

        expect { models }.to raise_error Fipe::Request::UnexpectedResponse
      end
    end
  end
end
