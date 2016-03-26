require 'rails_helper'

RSpec.describe Venue, type: :model do
  describe "Validate name" do
    it "Should be uniqueness" do
      list = build_list :venue, 2, :same_name 
      list[0].save
      expect(list[1].save).to eq(false)
    end
  end
end
