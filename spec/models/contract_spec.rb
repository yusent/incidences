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
end
