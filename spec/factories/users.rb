FactoryBot.define do
  factory :user do
    email { "daich@gmail.com" }
    nickname { "daichan" }
    status_i18n { "有効" }
    password { "123456" }
    password_confirmation { "123456" }
  end
end
