FactoryBot.define do
  factory :vehicle do
    brand { "FIAT" }
    model { "Uno" }
    plate { "abc1234" }
    manufacture_year { 2014 }
    model_year { 2014 }
  end
end
