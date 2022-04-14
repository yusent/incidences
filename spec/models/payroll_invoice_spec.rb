require 'rails_helper'

RSpec.describe PayrollInvoice, type: :model do
  let(:model) { FactoryBot.build :payroll_invoice }

  describe "associations" do
    it { should belong_to(:employee) }
  end

  describe "validations" do
    it { should validate_presence_of(:employee) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:concept) }

    it "should validate start_date is not after end_date" do
      model.start_date = model.end_date + 1.day
      expect(model).to be_invalid
    end
  end

  describe "total calculation" do
    let(:employee) { FactoryBot.create :employee }

    before(:each) do
      # Active contract
      FactoryBot.create :contract,
        employee: employee,
        active: true,
        gross_salary: 10_000

      # Other employee's incidences
      FactoryBot.create_list :incidence, 30,
        employee: FactoryBot.create(:employee),
        end_date: model.end_date

      # Out of range incidences
      FactoryBot.create_list :incidence, 30,
        employee: employee,
        end_date: model.end_date + 2.days
    end

    it "should add gross_salary, deductions and perceptions" do
      deductions = FactoryBot.create_list :incidence, 10,
        employee: employee,
        amount: 5,
        incidence_type: :deductions,
        end_date: model.end_date

      perceptions = FactoryBot.create_list :incidence, 10,
        employee: employee,
        amount: 10,
        incidence_type: :perceptions,
        end_date: model.end_date

      model.employee = employee
      model.save

      expect(model.total).to eq(10_050)
    end
  end
end
