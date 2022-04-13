require 'rails_helper'

RSpec.describe Contract, type: :model do
  let(:model) { FactoryBot.build :contract }

  describe "associations" do
    it { should belong_to(:employee) }
  end
end
