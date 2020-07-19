FactoryBot.define do
  factory :comment do
    user_id {1}
    association :article
    content {"content"}
    rate {0}
  end
end