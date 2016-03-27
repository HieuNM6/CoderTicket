class Venue < ActiveRecord::Base
  belongs_to :region
  validates_uniqueness_of :name

  def self.names
    names = []
    venues = Venue.all
    venues.each do |v|
      names << v.name 
    end
    names
  end
  def self.ids
    ids = []
    venues = Venue.all
    venues.each do |v|
      ids << v.id
    end
    ids
  end
end
