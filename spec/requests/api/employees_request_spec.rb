require 'rails_helper'

RSpec.describe Api::EmployeesController, type: :request do
  content_type = "application/json"

  describe "GET /index" do
    it "renders a successful response" do
      get api_employees_url, as: :json
      expect(response).to be_successful
      expect(response.content_type).to match(a_string_including(content_type))
    end

    it "renders a list of employees" do
      employees = FactoryBot.create_list :employee, 10

      contracts = employees.map do |e|
        FactoryBot.create :contract, employee: e, active: false
        FactoryBot.create :contract, employee: e, active: true
      end

      get api_employees_url, as: :json
      response_body = JSON.parse response.body

      expect(response_body.map { |e| e["id"] }.sort).to eq(employees.map(&:id))
      expect(response_body.map { |e| e["active_contract"]["id"] }.sort)
        .to eq(employees.map(&:active_contract).map(&:id).sort)
    end
  end

  describe "GET /payroll_invoices" do
    let(:employee) { FactoryBot.create :employee }

    it "renders a successful response" do
      get api_employee_payroll_invoices_url(id: employee.id), as: :json
      expect(response).to be_successful
      expect(response.content_type).to match(a_string_including(content_type))
    end

    it "renders a list of payroll invoices" do
      invoices = FactoryBot.create_list :payroll_invoice, 12, employee: employee
      FactoryBot.create_list :payroll_invoice, 3 # These shouldn't show

      get api_employee_payroll_invoices_url(id: employee.id), as: :json
      response_body = JSON.parse response.body

      expect(response_body.size).to eq(12)
      expect(response_body.map { |i| i["id"] }).to eq(invoices.map(&:id))
      expect(response_body.map { |i| i["employee_id"] }.uniq)
        .to eq([employee.id])
    end
  end
end
