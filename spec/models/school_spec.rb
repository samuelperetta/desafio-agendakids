require 'rails_helper'

RSpec.describe School, type: :model do
  describe 'When create schools' do
    context 'with valid fields' do
      let(:school) { build :school}
      it 'should be valid' do
        expect(school).to be_valid
      end

      it 'should be saved' do
        expect(school.save).to be_truthy
      end
    end

    context 'with invalid name' do
      let(:school) { build :school, name: nil}
      it 'should be invalid' do
        expect(school).to be_invalid
        expect(school.errors[:name].count).to eq 1
        expect(school.errors[:name].first).to be == I18n.t('activerecord.errors.messages.blank')
      end

      it 'should not be saved' do
        expect(school.save).to be_falsey
      end
    end

    context 'with invalid cnpj' do
      let(:school) { build :school, cnpj: nil}
      it 'should be invalid' do
        expect(school).to be_invalid
        expect(school.errors[:cnpj].count).to eq 1
        expect(school.errors[:cnpj].first).to be == I18n.t('activerecord.errors.messages.blank')
      end

      it 'should not be saved' do
        expect(school.save).to be_falsey
      end
    end

    context 'with existent cnpj' do
      let(:first_school) { create :school}
      let(:other_school) { build :school, cnpj: first_school.cnpj}
      it 'should return error' do
        expect(other_school).to be_invalid
        expect(other_school.errors[:cnpj].count).to eq 1
        expect(other_school.errors[:cnpj].first).to be == I18n.t('activerecord.errors.messages.taken')
      end
    end

    context 'and add a school unity' do
      let(:school) { build :school }
      let(:school_unity) { create :school_unity }
      it 'should increase schools unities number' do
        school.school_unities << school_unity
        expect{school.save}.to change(school.school_unities, :count).by(1)
      end
    end

    context 'and add a user' do
      let(:school) { build :school }
      let(:user) { create :user }
      it 'should increase users  number' do
        school.users << user
        expect{school.save}.to change(school.users, :count).by(1)
      end
    end

  end
end
