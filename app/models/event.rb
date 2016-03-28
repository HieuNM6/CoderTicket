class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  belongs_to :user
  has_many :ticket_types
  validate :validate_publish

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}
  
  def self.upcomming_events_with_published_event
    Event.where("starts_at > ? and publish = true", Time.now)
  end

  def self.upcomming_events
    Event.where("starts_at > ?", Time.now)
  end

  def self.event_searches_by_name_with_published_event search_params
    Event.where("name like ? and publish = true","%#{search_params.downcase}%")
  end

  def self.event_searches_by_name search_params
    Event.where("name like ?","%#{search_params.downcase}%")
  end

  def publish_event
    self.publish = true
    self.save
  end
  
  def validate_publish
    types = self.ticket_types
    if (publish == true) && (types.count < 1)
      errors.add(:publish," Need at least one ticket_type to publish")
    end  
  end

end
