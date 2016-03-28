FactoryGirl.define do
  factory :venue do
    sequence(:name) { |n|  "abcxzy#{n}" }
    region_id { Region.create(name:"Lam Dong").id ||
                Region.find_by(name: "Lam Dong").id}
    full_address "abcdxyz"
    trait :same_name do
      name "Abcxz"
    end
  end
end
