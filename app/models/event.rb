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
  belongs_to :user
  has_many :registrations
  has_many :attendees, :through => :registrations, :source => :user
  has_and_belongs_to_many :categories
  validates :title, presence: true
  validates :description, presence: true
  validates :occurs_on, presence: true
  validates :url, presence: true
  validates :location, presence: true

  def long_title
    "#{title} - #{location} - #{occurs_on}"
  end

end
