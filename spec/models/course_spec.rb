require 'rails_helper'

RSpec.describe Course, type: :model do
  context 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description) }
    it { should validate_presence_of(:author) }
  end

  context 'Associations' do
    it { should have_many(:reviews) }
  end
end
