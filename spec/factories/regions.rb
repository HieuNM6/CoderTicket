FactoryGirl.define do
  factory :region do
    trait :valid_name do
      sequence(:name) { |n| ['Ho Chi Minh', 'Ha Noi', 'Binh Thuan', 'Da Nang', 
                             'Lam Dong'][n-1] }
    end

    trait :invalid_name do 
      name "Abcd"
    end
  end
end
