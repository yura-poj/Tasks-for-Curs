FactoryBot.define do
  factory :station do
    name do |n|
      "Station name #{n}"
    end

    initialize_with { attributes }
  end
end