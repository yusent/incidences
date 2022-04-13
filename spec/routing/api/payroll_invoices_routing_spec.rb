require "rails_helper"

RSpec.describe Api::PayrollInvoicesController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/api/payroll_invoice").to route_to("api/payroll_invoices#create")
    end
  end
end
