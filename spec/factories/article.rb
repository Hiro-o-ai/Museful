FactoryBot.define do
  factory :article do
    association :user
    title { "title" }
    content {"content"}
    genre_ids {1}
  end
end