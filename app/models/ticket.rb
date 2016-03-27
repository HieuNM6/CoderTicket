class Ticket < ActiveRecord::Base
  belongs_to :ticket_type
  validates :count, :inclusion => {:in=> 1..10}
  validate :not_more_than_quantity,:no_past_event

  def not_more_than_quantity
    ticket_type = TicketType.find_by_id(ticket_type_id)
    total_count = count + Ticket.ticket_from_same_event(ticket_type)
    if( total_count > ticket_type.max_quantity)
      errors.add(:count, "need not more than quantity")
    end
  end

  def no_past_event
    ticket_type = TicketType.find_by_id(ticket_type_id)
    event = Event.find_by(id: ticket_type.event_id)
    if event.starts_at < Time.now
      errors.add(:ticket_type, "Cann't buy ticket of past event")
    end
  end

  def self.ticket_from_same_event type
    tickets = Ticket.where("ticket_type_id = ?", type.id)
    total_count = 0;
    tickets.each do |t|
      total_count += t.count
    end
    total_count
  end
end
