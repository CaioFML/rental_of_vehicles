RSpec.describe VehiclesController, type: :request do
  before { sign_in create(:user) }

  let!(:vehicle) { create(:vehicle) }

  describe "GET #index" do
    subject! { get vehicles_path }

    it { expect(response).to have_http_status :ok }
  end

  describe "GET #new" do
    subject(:get_new) { get new_vehicle_path }

    before do
      allow(Fipe::Request).to receive(:brands).and_return response_fipe

      get_new
    end

    let(:response_fipe) do
      [
        { "codigo" => "1", "nome" => "Acura" },
        { "codigo" => "2", "nome" => "Hyundai" }
      ]
    end

    it { expect(response).to have_http_status :ok }
    it { expect(assigns(:brands)).to match_array([%w[Acura 1], %w[Hyundai 2]]) }
  end

  describe "POST #create" do
    subject(:create_vehicle) { post vehicles_path, params: { vehicle: params } }

    let(:params) do
      {
        brand: "test_brand",
        model: "test_model",
        plate: "abc1725",
        manufacture_year: 2015,
        model_year: 2014
      }
    end

    it do
      create_vehicle

      expect(response).to redirect_to vehicles_path
    end

    it "creates vehicle" do
      expect { create_vehicle }.to change(Vehicle, :count).by 1
    end
  end

  describe "GET #edit" do
    subject(:get_edit) { get edit_vehicle_path(vehicle) }

    before do
      allow(Fipe::Request).to receive(:brands).and_return response_fipe

      get_edit
    end

    let(:response_fipe) do
      [
        { "codigo" => "1", "nome" => "Acura" },
        { "codigo" => "2", "nome" => "Hyundai" }
      ]
    end

    it { expect(response).to have_http_status :ok }
    it { expect(assigns(:brands)).to match_array([%w[Acura 1], %w[Hyundai 2]]) }
  end

  describe "PUT #update" do
    subject! { put vehicle_path(vehicle), params: { vehicle: params } }

    let(:params) do
      {
        brand: "CHEVROLET",
        model: "Onyx",
        plate: "abc1725",
        manufacture_year: 2018,
        model_year: 2018
      }
    end

    it "updates vehicle brand" do
      expect(vehicle.reload.brand).to eq params[:brand]
    end

    it "updates vehicle model" do
      expect(vehicle.reload.model).to eq params[:model]
    end

    it "updates vehicle plate" do
      expect(vehicle.reload.plate).to eq params[:plate]
    end

    it "updates vehicle manufacture_year" do
      expect(vehicle.reload.manufacture_year).to eq params[:manufacture_year]
    end

    it "updates vehicle model_year" do
      expect(vehicle.reload.model_year).to eq params[:model_year]
    end
  end

  describe "DELETE #destroy" do
    subject(:destroy) { delete vehicle_path(vehicle) }

    it { expect { destroy }.to change(Vehicle, :count).by(-1) }
  end
end
