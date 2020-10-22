RSpec.describe FipeController, type: :request do
  describe "GET #models" do
    subject(:get_models) { get models_path, params: { brand_id: brand_id } }

    let(:brand_id) { "2" }

    it do
      get_models
      expect(response).to have_http_status :ok
    end

    it "returns model of vehicles" do
      expect(Fipe::Request).to receive(:models).with(brand_id)
      get_models
    end
  end
end
