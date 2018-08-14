require 'rails_helper'

RSpec.describe Responsible, type: :model do
  describe 'When create responsible' do
    context 'with valid fields' do
      let(:responsible) { build :responsible }
      it 'should be valid' do
        expect(responsible).to be_valid
      end

      it 'should be saved' do
        expect(responsible.save).to be_truthy
      end
    end

    context 'with invalid name' do
      let(:responsible) { build :responsible, name: nil }
      it 'should be invalid' do
        expect(responsible).to be_invalid
        expect(responsible.errors[:name].count).to eq 1
        expect(responsible.errors[:name].first).to be == I18n.t('activerecord.errors.messages.blank')
      end

      it 'should not be saved' do
        expect(responsible.save).to be_falsey
      end
    end

    context 'with invalid email' do
      let(:responsible) { build :responsible, email: nil }
      it 'should be invalid' do
        expect(responsible).to be_invalid
        expect(responsible.errors[:email].count).to eq 1
        expect(responsible.errors[:email].first).to be == I18n.t('activerecord.errors.messages.blank')
      end

      it 'should not be saved' do
        expect(responsible.save).to be_falsey
      end
    end

    context 'with existent email' do
      let(:first_responsible) { create :responsible}
      let(:other_responsible) { build :responsible, email: first_responsible.email}
      it 'should return error' do
        expect(other_responsible).to be_invalid
        expect(other_responsible.errors[:email].count).to eq 1
        expect(other_responsible.errors[:email].first).to be == I18n.t('activerecord.errors.messages.taken')
      end
    end

    context 'and add a student' do
      let(:responsible) { build :responsible }
      let(:student) { create :student }
      it 'should increase students number' do
        responsible.students << student
        expect { responsible.save }.to change(responsible.students, :count).by(1)
      end
    end
  end
end
