require 'rails_helper'

RSpec.describe TicketType, type: :model do
  describe "Validates max_quantity" do
    let(:event) { create :event, :in_the_future }
    it "with empty max_quantity should not save" do
      ticket = build :ticket_type, event_id: event.id, max_quantity: ""
      expect(ticket.save).to eq(false)
    end
    it "with max_quantity should save" do
      ticket = build :ticket_type, event_id: event.id, max_quantity: 100
      expect(ticket.save).to eq(true)
    end
  end
  describe "#remaning_ticket" do 
    let(:event) { create :event, :in_the_future }
    it "will decrease if ticket has booked" do 
      ticket_type = create :ticket_type, event_id: event.id
      ticket = create :ticket, ticket_type: ticket_type
      remaining = TicketType.find(ticket_type.id).remaining_ticket
      tick2 = create :ticket, ticket_type: ticket_type, count: 4
      expect(remaining).to be >(TicketType.find(ticket_type.id).remaining_ticket)
    end
  end
end
