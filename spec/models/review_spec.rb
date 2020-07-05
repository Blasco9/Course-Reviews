require 'rails_helper'

RSpec.describe Review, type: :model do
  context 'Validations' do
    it { should validate_presence_of(:text) }
  end

  context 'Associations' do
    it { should have_many(:comments) }
    it { should belong_to(:author) }
    it { should belong_to(:course) }
  end
end
