require 'rails_helper'

RSpec.describe Employee, type: :model do
  let(:model) { FactoryBot.build :employee }

  describe "validations" do
    # Presence validations
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:rfc) }
    it { should validate_presence_of(:date_registered) }
    it { should validate_presence_of(:imss_number) }

    # Uniqueness validations
    it { should validate_uniqueness_of(:rfc) }
    it { should validate_uniqueness_of(:imss_number) }

    # Format validations
    it "should validate RFC format" do
      expect(model).to be_valid
      expect(model).to_not allow_value("Not an RFC").for(:rfc)
    end
  end
end
