require 'rails_helper'

RSpec.describe User, type: :model do
  context 'and add a school' do
    let(:user) { build :user }
    let(:school) { create :school }
    it 'should have a school' do
      user.school = school
      expect(user.save).to be_truthy
      expect(user.school.present?).to be_truthy
    end
  end
end
