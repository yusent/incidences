require 'rails_helper'

RSpec.describe Api::EmployeesController, type: :request do
  content_type = "application/json; charset=utf-8"

  describe "GET /index" do
    it "renders a successful response" do
      get api_employees_url, as: :json
      expect(response).to be_successful
    end

    it "renders a list of employees" do
      employees = FactoryBot.create_list :employee, 10
      get api_employees_url, as: :json
      response_body = JSON.parse response.body

      expect(response_body.map { |e| e["id"] }.sort).to eq(employees.map(&:id))
    end
  end
end
