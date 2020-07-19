FactoryBot.define do
  factory :answer do
    user_id { 1 }
    association :question
    content { "content" }
  end
end
