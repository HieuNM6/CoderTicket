FactoryGirl.define do
  factory :ticket_type do
    sequence(:name) { |n| "Ticket type #{n}"}
    sequence(:price) { |n| 100*n }
  end
end
