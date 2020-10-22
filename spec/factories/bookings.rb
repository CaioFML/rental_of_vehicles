FactoryBot.define do
  factory :booking do
    association :vehicle

    cpf { "12345678900" }
    start_at { Date.new(2020, 10, 10) }
    end_at { Date.new(2020, 10, 21) }
  end
end
