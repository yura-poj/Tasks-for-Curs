FactoryBot.define do
  factory :train do
    sequence(:number) { |n| n }

    initialize_with { attributes }
  end
end
