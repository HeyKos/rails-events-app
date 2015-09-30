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

require "spec_helper"


describe Event do
  # ------------------------------------------------------------------------------
  #
  # Unit Tests
  #
  # ------------------------------------------------------------------------------

  describe "unit tests", :unit do
    describe Event, :type => :model do
      it "is in the past" do
        test_event = build(:event, title: "Test Event", location: "Testville, PA", occurs_on: "01/01/1945", url: "http://thing.com", description: "This is a test.")
        expect(test_event).to be_invalid
      end
    end
  end # unit


  # ------------------------------------------------------------------------------
  #
  # Integration Tests
  #
  # ------------------------------------------------------------------------------

  describe "integration tests", :integration do

  end # integration

end

