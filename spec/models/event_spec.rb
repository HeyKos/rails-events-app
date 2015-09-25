# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  location   :string(255)
#  occurs_on  :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "spec_helper"


describe Event do

  # ------------------------------------------------------------------------------
  #
  # Unit Tests
  #
  # ------------------------------------------------------------------------------

  describe "unit tests", :unit do

  end # unit


  # ------------------------------------------------------------------------------
  #
  # Integration Tests
  #
  # ------------------------------------------------------------------------------

  describe "integration tests", :integration do

  end # integration

end

