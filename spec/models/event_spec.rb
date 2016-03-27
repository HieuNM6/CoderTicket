require 'rails_helper'

RSpec.describe Event, type: :model do
  describe ".upcomming_events" do
    let(:upcomming_events) {create_list(:event, 3, :in_the_future)}
    let(:past_events) {create_list(:event, 3, :in_the_past)}

    it "should return upcomming events" do
       expect(Event.upcomming_events).to match_array(upcomming_events)
    end

    it "should not return past events" do
      expect(Event.upcomming_events).not_to match_array(past_events)
    end
  end

  describe ".event_searches_by_name" do

    it "should return searched events by match name" do
      event1 = create(:event, :in_the_future, name:"abc")
      event2 = create(:event, :in_the_future, name:"zaabcasdf ")
      expect(Event.event_searches_by_name("AbC")).to match_array([event2, event1])
    end

    it "should not return search events by not match name" do
      event1 = create(:event, :in_the_future, name:"xyz")
      event2 = create(:event, :in_the_future, name:"xyzab")
      expect(Event.event_searches_by_name("AbC")).not_to match_array([event1, event2])
    end
  end

  describe "event must have at least one ticket_type to can be published" do
    let(:event) {create :event, :in_the_future, publish: false}

    it "should return false when have no ticket_type" do
      event.publish = true
      expect(event.save).to eq(false)
    end

    it "should return true when have at least one ticket_type" do
      type = create :ticket_type, event: event
      event.publish = true
      expect(event.save).to eq(true)
    end

  end
end
