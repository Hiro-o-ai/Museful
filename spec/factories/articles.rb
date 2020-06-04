FactoryBot.define do
  factory :article do
    user_id { 1 }
    genre_id { 1 }
    title { "MyString" }
    content { "MyText" }
    image_id { "MyString" }
  end
end
