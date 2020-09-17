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
end
