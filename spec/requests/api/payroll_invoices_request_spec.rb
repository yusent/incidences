require 'rails_helper'

RSpec.describe Api::PayrollInvoicesController, type: :request do
  content_type = "application/json"

  let(:employee) { FactoryBot.create :employee }

  let(:valid_attributes) do
    FactoryBot
      .build(:payroll_invoice, employee: employee)
      .attributes
  end

  let(:invalid_attributes) { PayrollInvoice.new.attributes }

  describe "POST /payroll_invoice" do
    context "with valid parameters" do
      it "creates a new payroll_invoice" do
        expect do
          post api_payroll_invoice_url, params: valid_attributes, as: :json
        end.to change(PayrollInvoice, :count).by(1)
      end

      it "renders a JSON response with the new payroll_invoice" do
        post api_payroll_invoice_url, params: valid_attributes, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including(content_type))
      end

      it "returns the calculated total" do
        FactoryBot.create :contract, active: true, employee: employee,
          gross_salary: 144
        FactoryBot.create :incidence, incidence_type: :deductions,
          amount: 1.1, employee: employee
        FactoryBot.create :incidence, incidence_type: :perceptions,
          amount: 2.2, employee: employee

        post api_payroll_invoice_url, params: valid_attributes, as: :json
        response_body = JSON.parse response.body
        expect(response_body["total"]).to eq(145.1)
      end
    end

    context "with invalid parameters" do
      it "does not create a new payroll_invoice" do
        expect { post api_payroll_invoice_url, params: invalid_attributes, as: :json }
          .to change(PayrollInvoice, :count).by(0)
      end

      it "renders a JSON response with errors" do
        post api_payroll_invoice_url, params: invalid_attributes, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including(content_type))
      end
    end
  end
end
