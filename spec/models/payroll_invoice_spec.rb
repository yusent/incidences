require 'rails_helper'

RSpec.describe PayrollInvoice, type: :model do
  let(:model) { FactoryBot.build :payroll_invoice }

  describe "associations" do
    it { should belong_to(:employee) }
  end

  describe "validations" do
    # Presence validations
    it { should validate_presence_of(:employee) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:concept) }
    it { should validate_presence_of(:total) }

    # Number validations
    it { should validate_numericality_of(:total).is_greater_than(0) }
  end
end
