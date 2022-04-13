require 'rails_helper'

RSpec.describe PayrollInvoice, type: :model do
  let(:model) { FactoryBot.build :payroll_invoice }

  describe "associations" do
    it { should belong_to(:employee) }
  end

  describe "validations" do
    it { should validate_numericality_of(:total).is_greater_than(0) }
  end
end
