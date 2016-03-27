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
end
