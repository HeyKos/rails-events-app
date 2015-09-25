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
#

class Event < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :occurs_on, presence: true
  validates :url, presence: true
  validates :location, presence: true
end
