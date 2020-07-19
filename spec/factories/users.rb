FactoryBot.define do
  factory :user do
    email { "daich@gmail.com" }
    nickname { "daichan" }
    password { "123456" }
    password_confirmation { "123456" }
  end
end
