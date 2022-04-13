require "rails_helper"

RSpec.describe Api::IncidencesController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/api/incidence").to route_to("api/incidences#create")
    end
  end
end
