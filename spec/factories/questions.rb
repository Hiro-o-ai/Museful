FactoryBot.define do
  factory :question do
    user_id { 1 }
    genre_id { 1 }
    title { "MyString" }
    content { "MyText" }
    flag { 1 }
  end
end
