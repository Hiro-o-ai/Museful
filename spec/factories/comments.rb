FactoryBot.define do
  factory :comment do
    user_id { 1 }
    target_id { 1 }
    title { "MyString" }
    content { "MyText" }
    rate { 1.5 }
    status { 1 }
  end
end
