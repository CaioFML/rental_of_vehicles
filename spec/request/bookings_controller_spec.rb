RSpec.describe BookingsController, type: :request do
  describe "GET #index" do
    subject(:index_bookings) { get bookings_path }

    before { sign_in create(:user) }

    it do
      index_bookings

      expect(response).to have_http_status :ok
    end
  end

  describe "GET #new" do
    subject! { get new_booking_path }

    it { expect(response).to have_http_status :ok }
  end

  describe "POST #create" do
    subject(:create_booking) { post bookings_path, params: { booking: params } }

    let(:vehicle) { create(:vehicle) }
    let(:params) do
      {
        cpf: "82244698633",
        vehicle_id: vehicle.id,
        start_at: "2020-10-21",
        end_at: "2020-10-22"
      }
    end

    it "creates booking" do
      expect { create_booking }.to change(Booking, :count).by 1
    end

    it do
      create_booking

      expect(response).to redirect_to root_path
    end

    it "displays flash message" do
      create_booking

      expect(flash[:notice]).to eq "Reserva realizada com sucesso."
    end
  end
end
