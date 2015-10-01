# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  location    :string(255)
#  occurs_on   :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  url         :string(255)
#  description :string(255)
#  user_id     :integer
#
# Indexes
#
#  index_events_on_user_id  (user_id)
#

class Event < ActiveRecord::Base
  acts_as_taggable
  # Associations
  belongs_to :user
  has_many :registrations
  has_many :attendees, :through => :registrations, :source => :user
  has_and_belongs_to_many :categories
  # Validation
  validates :title, presence: true
  validates :description, presence: true
  validates :occurs_on, presence: true
  validates :url, presence: true
  validates :location, presence: true
  validate :has_not_occurred
  # Event callbacks
  after_create :ensure_owner_attends

  def long_title
    "#{title} - #{location} - #{occurs_on}"
  end

  def is_in_the_past?
    occurs_on < Date.today
  end

  def owned_by?(owner)
    return false unless owner.is_a? User
    user == owner
  end

  def self.search(search_for)
    where("title LIKE ?", "%#{search_for}%")
    where("description LIKE ?", "%#{search_for}%")
  end

  protected
    def has_not_occurred
      errors.add("occurs_on", "is in the past") if occurs_on && is_in_the_past?
    end

    def ensure_owner_attends
      if user and !attendees.include? user
        attendees << user
      end
    end

end
