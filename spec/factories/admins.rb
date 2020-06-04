FactoryBot.define do
  factory :admin do
    email { "move@move.com" }
    password { "useful" }
    password_confirmation { "useful" }
  end
end
