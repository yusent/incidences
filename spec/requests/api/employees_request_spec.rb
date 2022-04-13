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
end
