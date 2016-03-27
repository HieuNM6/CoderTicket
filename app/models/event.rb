class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  belongs_to :user
  has_many :ticket_types

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}
  
  def self.upcomming_events
    Event.where("starts_at > ?", Time.now)
  end

  def self.event_searches_by_name search_params
    Event.where("name like ?","%#{search_params.downcase}%")
  end
end
