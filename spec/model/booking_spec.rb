RSpec.describe Booking, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_presence_of(:vehicle) }
    it { is_expected.to validate_presence_of(:start_at) }
    it { is_expected.to validate_presence_of(:end_at) }
  end

  describe "scopes" do
    describe ".booking_period" do
      subject(:booking_period) { described_class.booking_period(Date.new(2020, 10, 10), Date.new(2020, 10, 21)) }

      before { create(:booking, start_at: Date.new(2020, 10, 21), end_at: Date.new(2020, 10, 30)) }

      let!(:vehicles) do
        [
          create(:booking, start_at: Date.new(2020, 10, 15), end_at: Date.new(2020, 10, 21)),
          create(:booking, start_at: Date.new(2020, 10, 10), end_at: Date.new(2020, 10, 14))
        ]
      end

      it "filters bookings by booking period" do
        expect(booking_period).to match_array vehicles
      end
    end
  end
end
