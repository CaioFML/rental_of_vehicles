RSpec.describe "Bookings", type: :system do
  describe "#new" do
    before do
      vehicle

      visit root_path
    end

    let(:vehicle) { create(:vehicle) }

    it "adds new booking" do
      select vehicle.full_name, from: "booking[vehicle_id]"
      fill_in "Início", with: Date.today
      fill_in "Fim", with: Date.tomorrow
      fill_in "CPF", with: "12345678900"
      click_button "Reservar"

      expect(page).to have_content "Reserva realizada com sucesso."
    end
  end
end
