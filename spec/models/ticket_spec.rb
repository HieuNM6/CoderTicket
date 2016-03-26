require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe "validate count" do
    let(:event) { create :event, :in_the_future }
    let(:ticket_type) { create :ticket_type, max_quantity: 12, event: event }
    let(:ticket1) { build :ticket, count: 4, ticket_type: ticket_type}

    it "larger quantity should false" do
      ticket1.save
      ticket2 = build :ticket, count:9, ticket_type: ticket_type
      expect(ticket2.save).to eq(false)
    end

    it "smaller quantity should true" do
      ticket1.save
      ticket2 = build :ticket, count: 8, ticket_type: ticket_type
      expect(ticket2.save).to eq(true)
    end

    it "smaller than 10 should true" do
      ticket = build :ticket, count: 7, ticket_type: ticket_type
      expect(ticket.save).to eq(true)
    end

    it "larger than 10 should false" do
      ticket = build :ticket, count: 11, ticket_type: ticket_type
      expect(ticket.save).to eq(false)
    end
  end

  describe "validate ticket_type" do 
    let(:past_event) { create :event, :in_the_past }
    let(:future_event) { create :event, :in_the_future }
    let(:past_ticket) { create :ticket_type, max_quantity: 10, event: past_event}
    let(:future_ticket) {create :ticket_type, max_quantity: 10, event: future_event}

    it "can't buy ticket of past event" do
       ticket = build :ticket, ticket_type: past_ticket
       expect(ticket.save).to eq(false)
    end

    it "can buy ticket of future event" do
       ticket = build :ticket, ticket_type: future_ticket
       expect(ticket.save).to eq(true)
    end
  end
end

