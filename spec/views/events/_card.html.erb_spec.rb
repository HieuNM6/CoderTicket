require 'rails_helper'
describe 'events/card' do
  it "have link to details" do
    @event = create :event, :in_the_future
    render partial: "events/card", locals: {event: @event}
    #expect(rendered).to have_link(event_path(@event))
    expect(rendered).to have_link "To details" , href: event_path(@event)
  end
end
