FactoryBot.define do
  factory :question do
    association :user
    title { "title" }
    content {"content"}
    genre_ids {1}
  end
end