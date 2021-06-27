FactoryBot.define do
  factory :train do
    sequence(:number)  {|n| n}
    number_carriage {2}

    initialize_with { attributes }
  end
end
