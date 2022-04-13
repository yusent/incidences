require 'rails_helper'

RSpec.describe Incidence, type: :model do
  let(:model) { FactoryBot.build :incidence }

  describe "associations" do
    it { should belong_to(:employee) }
  end

  describe "attributes" do
    it { should define_enum_for(:incidence_type)
      .with_values(%i[deductions perceptions]) }

    it { should define_enum_for(:concept)
      .with_values(%i[illness absence delay vacation extrahours extraday]) }
  end

  describe "validations" do
    it { should validate_numericality_of(:amount).is_greater_than(0) }
  end
end
