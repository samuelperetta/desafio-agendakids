require 'rails_helper'

RSpec.describe Teacher, type: :model do
  describe 'When create teacher' do
    context 'with valid fields' do
      let(:teacher) { build :teacher }
      it 'should be valid' do
        expect(teacher).to be_valid
      end

      it 'should be saved' do
        expect(teacher.save).to be_truthy
      end
    end

    context 'with invalid name' do
      let(:teacher) { build :teacher, name: nil }
      it 'should be invalid' do
        expect(teacher).to be_invalid
        expect(teacher.errors[:name].count).to eq 1
        expect(teacher.errors[:name].first).to be == I18n.t('activerecord.errors.messages.blank')
      end

      it 'should not be saved' do
        expect(teacher.save).to be_falsey
      end
    end

    context 'with invalid registration' do
      let(:teacher) { build :teacher, registration: nil }
      it 'should be invalid' do
        expect(teacher).to be_invalid
        expect(teacher.errors[:registration].count).to eq 1
        expect(teacher.errors[:registration].first).to be == I18n.t('activerecord.errors.messages.blank')
      end

      it 'should not be saved' do
        expect(teacher.save).to be_falsey
      end
    end

    context 'with existent registration' do
      let(:first_teacher) { create :teacher}
      let(:other_teacher) { build :teacher, registration: first_teacher.registration}
      it 'should return error' do
        expect(other_teacher).to be_invalid
        expect(other_teacher.errors[:registration].count).to eq 1
        expect(other_teacher.errors[:registration].first).to be == I18n.t('activerecord.errors.messages.taken')
      end
    end

    context 'and add a schools class' do
      let(:teacher) { build :teacher }
      let(:school_unity) { create :school_unity }
      it 'should increase schools unities number' do
        teacher.school_unities << school_unity
        expect{teacher.save}.to change(teacher.school_unities, :count).by(1)
      end
    end
  end
end
