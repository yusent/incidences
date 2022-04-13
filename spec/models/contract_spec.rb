require 'rails_helper'

RSpec.describe Contract, type: :model do
  let(:model) { FactoryBot.build :contract }

  describe "associations" do
    it { should belong_to(:employee) }
  end

  describe "attributes" do
    it { should define_enum_for(:payroll_type)
      .with_values(%i[weekly biweekly monthly]) }
  end

  describe "validations" do
    # Presence validations
    it { should validate_presence_of(:employee) }
    it { should validate_presence_of(:gross_salary) }
    it { should validate_presence_of(:payroll_type) }

    # Number validations
    it { should validate_numericality_of(:gross_salary).is_greater_than(0) }
  end

  describe "after save" do
    it "should only be one active contract per employee" do
      model.update_attributes active: true
      FactoryBot.create :contract, employee: model.employee, active: true
      expect(Contract.find(model.id).active).to be(false)
    end
  end
end
