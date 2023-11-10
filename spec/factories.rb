FactoryBot.define do
  factory :pokemon do
    id { 25 }
    name { "Pikachu" }
    order { 25 }
    base_experience { 112 }
    height { 4 }
    weight { 60 }
    types { ['electric'] }
  end
end
