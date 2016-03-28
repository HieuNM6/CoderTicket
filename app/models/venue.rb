class Venue < ActiveRecord::Base
  belongs_to :region
  validates_uniqueness_of :name
  validates :name, presence: true
  validates :full_address, presence: true
  validates :region_id, presence: true

end
