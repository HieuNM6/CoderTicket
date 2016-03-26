class TicketType < ActiveRecord::Base
  belongs_to :event
  validates  :max_quantity, presence: true
end
