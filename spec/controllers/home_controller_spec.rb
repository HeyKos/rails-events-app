require "rails_helper"

describe HomeController do

  # ------------------------------------------------------------------------------
  #
  # Integration Tests
  #
  # ------------------------------------------------------------------------------

  describe "integration tests", :integration do

    describe "when unauthenticated" do

      # Index
      # -----

      describe "GET #index" do
        it "redirects to events index" do
          get :index
          expect(response).to redirect_to(events_path)
        end
      end

    end

  end

end
