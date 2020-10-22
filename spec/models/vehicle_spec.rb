RSpec.describe Vehicle, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :brand }
    it { is_expected.to validate_presence_of :model }
    it { is_expected.to validate_presence_of :plate }
    it { is_expected.to validate_presence_of :model_year }
    it { is_expected.to validate_presence_of :manufacture_year }
  end

  describe "#full_name" do
    subject(:full_name) { vehicle.full_name }

    let(:vehicle) { create(:vehicle, brand: "FIAT", model: "Uno", model_year: 2016) }

    it "formats full name of vehicle" do
      expect(full_name).to eq "FIAT - Uno - 2016"
    end
  end
end
