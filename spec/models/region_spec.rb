require 'rails_helper'

RSpec.describe Region, type: :model do
  describe "Validate name" do

    it "Should valid with valid names" do
      valid_regions = build_list :region, 5, :valid_name
      valids = []
      valid_regions.each do |v|
        valids << v.valid?
      end
      expect(valids).not_to include(false)
    end

    it "Should invalid with invalid name" do
      invalid_region = build :region, :invalid_name
      expect(invalid_region.valid?).to eq(false)
    end
  end
end
