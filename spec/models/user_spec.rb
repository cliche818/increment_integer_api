require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'increment_number' do
    it 'should increment the number by 1' do
      user = create(:user)
      user.increment_number
      user.reload
      expect(user.number).to eq(1)
    end
  end

  describe 'reset_number' do
    it 'should set the number to the target' do
      user = create(:user)
      user.reset_number(101)
      user.reload
      expect(user.number).to eq(101)
    end

    it 'should not do anything if the number is not valid' do
      user = create(:user)
      user.reset_number(-1)
      user.reload
      expect(user.number).to eq(0)
    end
  end

  describe 'valid_number?' do
    it 'should return true for a number above or equal to 0' do
      expect(User.valid_number?(0)).to eq(true)
    end

    it 'should return false for a number below 0' do
      expect(User.valid_number?(-1)).to eq(false)
    end
  end
end
