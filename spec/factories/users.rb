FactoryBot.define do
  factory :user do
    email { "daich@gmail.com" }
    nickname { "daichan" }
    flag { 1 }
    password { "123456" }
    password_confirmation { "123456" }
  end
end
