require "rails_helper"

RSpec.describe Api::EmployeesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/employees").to route_to("api/employees#index")
    end
  end
end
