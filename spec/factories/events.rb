FactoryGirl.define do
  factory :event do
    sequence(:name) {|n| "foo#{n}"}
    sequence(:venue_id) { |n| Venue.create(name:"fck #{n}").id }
    extended_html_description "abcd"
    category_id { Category.create(name:"Learning").id ||
                  Category.find_by(name: "Learning").id
                  }

    trait :in_the_future do
      sequence(:starts_at) { |n|  n.days.from_now }
    end

    trait :in_the_past do
      sequence(:starts_at) { |n|  n.days.ago }
    end
  end
  factory :category do
    name 'Learning'
  end
end
