class TicketType < ActiveRecord::Base
  belongs_to :event
  has_many :tickets
  validates  :max_quantity, presence: true

  def remaining_ticket
    tickets = self.tickets
    count = 0
    tickets.each do |t|
      count += t.count
    end
    max_quantity - count
  end
end
