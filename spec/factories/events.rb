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

FactoryGirl.define do
  factory :event do
    title "MyString"
location "MyString"
occurs_on "2015-09-25"
  end

end
