# frozen_string_literal: true

require 'rails_helper'

describe User do
  before { @user = FactoryBot.build(:user) }

  subject { @user }
  it { should respond_to(:auth_token)}
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }

  describe "#generate_authentication_token!" do
    it "generates a unique token" do
      Devise.stub(:friendly_token).and_return("myuniquetoken")
      @user.generate_authentication_token!
      expect(@user.auth_token).to eql "myuniquetoken"
    end
  end
  it "generate another token if one is already taken" do
    existing_user = FactoryBot.create(:user, auth_token: "myuniquetoken")
    @user.generate_authentication_token!
    expect(@user.auth_token).not_to eql existing_user.auth_token
  end
end
