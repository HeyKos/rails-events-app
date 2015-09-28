# == Schema Information
#
# Table name: registrations
#
#  id         :integer          not null, primary key
#  note       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  event_id   :integer
#
# Indexes
#
#  index_registrations_on_event_id  (event_id)
#  index_registrations_on_user_id   (user_id)
#

FactoryGirl.define do
  factory :registration do
    note "MyText"
created_at "2015-09-28 10:29:51"
  end

end
