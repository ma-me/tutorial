require 'rails_helper'

RSpec.describe SessionsHelper do
  include SessionsHelper

  let(:user) { build(:user) }

  describe 'current_user' do
    it 'returns right user when session is anil' do
      log_in user
      remember user

      expect(user).to eq current_user
      expect(logged_in?).to eq true
    end

    it 'returns nil when remember digest is wrong' do
      log_in user
      remember user

      user.update_attribute(:remember_digest, (User.digest(User.new_token)))      
      expect(current_user).to eq nil
    end
  end

end
