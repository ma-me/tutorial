require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = build(:user)
  end

  # バリデーション
  context 'validate' do
    it 'is valid with name and email' do
      expect(@user).to be_valid
    end

    it 'name should be present' do
      @user.name = "  "
      expect(@user).not_to be_valid
    end

    it 'email should be present' do
      @user.email = " "
      expect(@user).not_to be_valid
    end

    it 'name should not be too long' do
      @user.name = "a" * 51
      expect(@user).not_to be_valid
    end

    it 'email should not be too long' do
      @user.email = "b" * 256
      expect(@user).not_to be_valid
    end

    it 'email should accepts valid address' do
      valid_addresses = %w(user@example.com
                           USER@foo.COM A_US-ER@foo.bar.org
                           first.last@foo.jp alice+bob@baz.cn)

      valid_addresses.each do |address|
        @user.email = address
        expect(@user).to be_valid
      end
    end

    it 'email should be unique' do
      duplicate_user = @user.deep_dup
      duplicate_user.email = @user.email.upcase
      @user.save
      expect(duplicate_user).not_to be_valid
    end

    it 'password should be present' do
      @user.password = @user.password_confirmation = " " * 6
      expect(@user).not_to be_valid
    end

    it 'password should have a minimum length' do
      @user.password = @user.password_confirmation = " " * 5
      expect(@user).not_to be_valid
    end
  end
end
