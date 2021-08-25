RSpec.describe "Vehicles", type: :system do
  describe "#new" do
    before do
      allow(Fipe::Request).to receive(:brands).and_return response_brands
      allow(Fipe::Request).to receive(:models).and_return response_models

      sign_in user

      visit new_vehicle_path
    end

    let(:user) { create(:user) }
    let(:response_brands) do
      [
        { "codigo" => "1", "nome" => "Acura" },
        { "codigo" => "2", "nome" => "Hyundai" }
      ]
    end

    let(:response_models) do
      {
        "modelos": [
          { "nome" => "Integra GS 1.8", "codigo" => 1 },
          { "nome" => "Integra GS 2.0", "codigo" => 1 }
        ]
      }
    end

    it "adds new vehicle", js: true do
      expect(page).to have_content "Adicione um carro"

      select "Acura", from: "vehicle[brand_id]"
      select "Integra GS 2.0", from: "vehicle[model]"
      fill_in "vehicle[plate]", with: "1234ABC"
      fill_in "vehicle[model_year]", with: "1998"
      fill_in "vehicle[manufacture_year]", with: "1998"
      click_on "Salvar"

      expect(page).to have_current_path vehicles_path
      expect(page).to have_selector "table tbody tr td", text: "Integra GS 2.0"
    end
  end
end
