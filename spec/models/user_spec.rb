require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do
    subject { User.create(username: 'user', full_name: 'user') }

    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:full_name) }
  end

  context 'Associations' do
    it { should have_many(:reviews) }
    it { should have_many(:comments) }
    it { should have_many(:followings) }
    it { should have_many(:inverse_followings) }
    it { should have_many(:followers) }
    it { should have_many(:followeds) }
  end
end
