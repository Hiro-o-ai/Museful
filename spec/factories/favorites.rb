FactoryBot.define do
  factory :favorite do
    user_id { 1 }
    target_id { 1 }
    type { 1 }
  end
end
