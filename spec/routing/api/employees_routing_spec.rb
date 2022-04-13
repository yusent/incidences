require "rails_helper"

RSpec.describe Api::EmployeesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/employees").to route_to("api/employees#index")
    end

    it "routes to #payroll_invoices" do
      expect(get: "/api/employee/1/payroll_invoices")
        .to route_to("api/employees#payroll_invoices", id: "1")
    end
  end
end
