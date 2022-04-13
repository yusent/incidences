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
  end
end
