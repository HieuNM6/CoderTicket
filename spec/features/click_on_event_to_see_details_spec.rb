require 'rails_helper'

RSpec.feature "Home page", type: :feature do
  it "have title" do
    visit root_path
    expect(page).to have_content "Discover upcoming events"
  end
end 
